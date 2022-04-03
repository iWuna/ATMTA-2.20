/obj/item/radio/uplink/clown/New()
	..()
	if(hidden_uplink)
		hidden_uplink.uplink_type = UPLINK_TYPE_CLOWN
		hidden_uplink.update_uplink_items()

/obj/item/radio/uplink/clown/Destroy()
	return ..()

//Clown
/datum/uplink_item/clownlube
	name = "Lubricant Grenade"
	desc = "A grenade that explodes into HOLY LUBRICANT!"
	reference = "BG"
	item = /obj/item/grenade/chem_grenade/lube
	cost = 15
	uplinktypes = list(UPLINK_TYPE_CLOWN)

/datum/uplink_item/clownflag
	name = "Clown Flag"
	desc = "GLORY TO HONKMOTHER!"
	reference = "CM"
	item = /obj/item/flag/clown
	cost = 5
	uplinktypes = list(UPLINK_TYPE_CLOWN)

/datum/uplink_item/revolver_clown
	name = "Tricky Revolver"
	desc = "A revolver that can be used for russian roulette."
	reference = "CTR"
	item = /obj/item/gun/projectile/revolver/russian
	cost = 5
	uplinktypes = list(UPLINK_TYPE_CLOWN)