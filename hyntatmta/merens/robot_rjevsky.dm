GLOBAL_LIST_INIT(anekdoty_rjevsky_list, file2list("hyntatmta/txt/anekdoty_rjevsky.txt"))

/mob/living/simple_animal/rjevsky_bot
	name = "Old Russian bot"
	desc = "Господи, он еще и анекдоты рассказывает!"
	icon = 'hyntatmta/icons/mob/rjevsky.dmi'
	icon_state = "robot_podporuchic"
	icon_living = "robot_podporuchic"
	icon_dead = "robot_podporuchic"
	wander = FALSE
	universal_speak = TRUE
	health = 100
	maxHealth = 100
	melee_damage_lower = 2
	melee_damage_upper = 2
	melee_damage_type = BURN
	attacktext = "slashes"
	attack_sound = "swings"
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "kicks"
	speed = 0
	speak_chance = 3
	speak_emote = list("beeps","clicks","chirps")
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 500
	loot = list(/obj/effect/decal/cleanable/blood/gibs/robot)
	del_on_death = 1
	var/emagged = FALSE

/mob/living/simple_animal/rjevsky_bot/handle_automated_speech()
	..()
	if(prob(speak_chance))
		var/phrase = pick(GLOB.anekdoty_rjevsky_list)
		say("[phrase]")

/mob/living/simple_animal/rjevsky_bot

/mob/living/simple_animal/rjevsky_bot/Destroy()
	if(emagged)
		explosion(get_turf(src), -1, -1, 3, 5)
	return ..()

/mob/living/simple_animal/rjevsky_bot/welder_act(mob/user, obj/item/I)
	if(user.a_intent != INTENT_HELP)
		return
	if(user == src)
		return
	if(health >= maxHealth)
		to_chat(user, "<span class='warning'>[src] does not need repairing!</span>")
		return
	. = TRUE
	if(!I.use_tool(src, user, volume = I.tool_volume))
		return
	adjustHealth(-5)
	add_fingerprint(user)
	user.visible_message("[user] repairs [src]!","<span class='notice'>You repair [src].</span>")

/mob/living/simple_animal/rjevsky_bot/emag_act(mob/living/user)
	if(emagged)
		to_chat(user, "<span class='warning'>[src] doesn't seem to respond.</span>")
		return FALSE
	else
		emagged = TRUE
		to_chat(user, "<span class='notice'>You short out the security protocols and rewrite [src]'s internal memory. Now it's fucking angry Russian bot.</span>")
		add_attack_logs(user, src, "Emagged")
		maxHealth = 150
		health = 150
		melee_damage_lower = 15
		melee_damage_upper = 15
		attack_sound = 'sound/machines/defib_zap.ogg'
		say("Я вас всех порешаю! Я... я...", "Проклятые коммунисты! Я вас, я... я...", "За царя! Вы все... все...")
		update_icon()
		spawn(50)
			Destroy()

/mob/living/simple_animal/rjevsky_bot/proc/update_icon()
	if(emagged)
		icon_state = "robot_podporuchic_angry"
		icon_living = "robot_podporuchic_angry"
	else
		icon_state = "robot_podporuchic"
		icon_living = "robot_podporuchic"