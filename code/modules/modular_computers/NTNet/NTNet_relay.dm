// Relays don't handle any actual communication. Global NTNet datum does that, relays only tell the datum if it should or shouldn't work.
/obj/machinery/ntnet_relay
	name = "NTNet Quantum Relay"
	desc = "A very complex router and transmitter capable of connecting electronic devices together. Looks fragile."
	use_power = ACTIVE_POWER_USE
	active_power_usage = 100 // 100 watts. Yes I know this is a high power machine but this fucking obliterates an unpowered smes (AI sat)
	idle_power_usage = 100
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "bus"
	anchored = 1
	density = 1
	var/datum/ntnet/NTNet = null // This is mostly for backwards reference and to allow varedit modifications from ingame.
	var/enabled = 1				// Set to 0 if the relay was turned off
	var/dos_failure = 0			// Set to 1 if the relay failed due to (D)DoS attack
	var/list/dos_sources = list()	// Backwards reference for qdel() stuff

	// Denial of Service attack variables
	var/dos_overload = 0		// Amount of DoS "packets" in this relay's buffer
	var/dos_capacity = 500		// Amount of DoS "packets" in buffer required to crash the relay
	var/dos_dissipate = 1		// Amount of DoS "packets" dissipated over time.


// TODO: Implement more logic here. For now it's only a placeholder.
/obj/machinery/ntnet_relay/inoperable(additional_flags = 0)
	if(stat & (BROKEN | NOPOWER | EMPED | additional_flags))
		return 1
	if(dos_failure)
		return 1
	if(!enabled)
		return 1
	return 0

/obj/machinery/ntnet_relay/update_icon()
	if(operable())
		icon_state = "bus"
	else
		icon_state = "bus_off"

/obj/machinery/ntnet_relay/process()
	if(operable())
		use_power = ACTIVE_POWER_USE
	else
		use_power = IDLE_POWER_USE

	update_icon()

	if(dos_overload)
		dos_overload = max(0, dos_overload - dos_dissipate)

	// If DoS traffic exceeded capacity, crash.
	if((dos_overload > dos_capacity) && !dos_failure)
		dos_failure = 1
		update_icon()
		GLOB.ntnet_global.add_log("Quantum relay switched from normal operation mode to overload recovery mode.")
	// If the DoS buffer reaches 0 again, restart.
	if((dos_overload == 0) && dos_failure)
		dos_failure = 0
		update_icon()
		GLOB.ntnet_global.add_log("Quantum relay switched from overload recovery mode to normal operation mode.")
	..()

/obj/machinery/ntnet_relay/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, var/force_open = TRUE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "ntnet_relay.tmpl", "NTNet Quantum Relay", 500, 300)
		ui.open()

/obj/machinery/ntnet_relay/ui_data(mob/user)
	var/list/data = list()
	data["enabled"] = enabled
	data["dos_capacity"] = dos_capacity
	data["dos_overload"] = dos_overload
	data["dos_crashed"] = dos_failure
	return data


/obj/machinery/ntnet_relay/Topic(href, list/href_list)
	if(..())
		return
	switch(href_list["action"])
		if("restart")
			dos_overload = 0
			dos_failure = 0
			update_icon()
			GLOB.ntnet_global.add_log("Quantum relay manually restarted from overload recovery mode to normal operation mode.")
		if("toggle")
			enabled = !enabled
			GLOB.ntnet_global.add_log("Quantum relay manually [enabled ? "enabled" : "disabled"].")
			update_icon()
	return 1


/obj/machinery/ntnet_relay/attack_hand(mob/living/user)
	ui_interact(user)

/obj/machinery/ntnet_relay/New()
	uid = gl_uid
	gl_uid++
	component_parts = list()
	component_parts += new /obj/item/circuitboard/machine/ntnet_relay(null)
	component_parts += new /obj/item/stack/cable_coil(null, 2)

	if(GLOB.ntnet_global)
		GLOB.ntnet_global.relays.Add(src)
		NTNet = GLOB.ntnet_global
		GLOB.ntnet_global.add_log("New quantum relay activated. Current amount of linked relays: [NTNet.relays.len]")
	..()

/obj/machinery/ntnet_relay/Destroy()
	if(GLOB.ntnet_global)
		GLOB.ntnet_global.relays.Remove(src)
		GLOB.ntnet_global.add_log("Quantum relay connection severed. Current amount of linked relays: [NTNet.relays.len]")
		NTNet = null

	for(var/datum/computer_file/program/ntnet_dos/D in dos_sources)
		D.target = null
		D.error = "Connection to quantum relay severed"

	return ..()

/obj/item/circuitboard/machine/ntnet_relay
	name = "NTNet Relay (Machine Board)"
	build_path = /obj/machinery/ntnet_relay
	origin_tech = "programming=3;bluespace=3;magnets=2"
	req_components = list(/obj/item/stack/cable_coil = 2)
