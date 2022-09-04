/mob/living/simple_animal/hostile/scp049
	name = "Plague Doctor"
	desc = "Мужчина средних лет в балахоне чумного доктора..."
	icon = 'hyntatmta/icons/mob/scp049.dmi'
	icon_state = "scp49"
	icon_living = "scp49"
	icon_dead = "scp49_d"
	speak_chance = 10
	turns_per_move = 5
	response_help = "pushes the"
	response_disarm = "shoves"
	response_harm = "hits the"
	speed = 0.5
	maxHealth = 250
	health = 250

	vision_range = 8
	aggro_vision_range = 6

	harm_intent_damage = 5
	obj_damage = 60
	melee_damage_lower = 30
	melee_damage_upper = 30
	attacktext = "бьёт"
	attack_sound = 'sound/hallucinations/growl1.ogg'

	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	speak_emote = list("Я чувствую поветрие в воздухе.")
	faction = list("scp")
	sentience_type = SENTIENCE_OTHER