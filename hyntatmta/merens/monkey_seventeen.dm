GLOBAL_LIST_INIT(anekdoty_list, file2list("hyntatmta/txt/anekdoty.txt"))

/datum/species/monkey_stirlitz
	name = "Monkey Stirlitz"
	name_plural = "Monkeys"
	blurb = "Ook."

	icobase = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	deform = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	damage_overlays = 'icons/mob/human_races/masks/dam_monkey.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_monkey.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_monkey.dmi'
	language = null
	default_language = "Sol Common"
	species_traits = list(NO_EXAMINE)
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	greater_form = /datum/species/human
	no_equip = list(slot_belt, slot_wear_id, slot_l_ear, slot_r_ear, slot_glasses, slot_gloves, slot_shoes, slot_wear_suit, slot_w_uniform, slot_l_store, slot_r_store, slot_s_store, slot_wear_pda)
	can_craft = FALSE
	is_small = 1
	has_fine_manipulation = 0
	ventcrawler = VENTCRAWLER_NUDE
	dietflags = DIET_OMNI
	show_ssd = 0
	eyes = "blank_eyes"
	death_message = "lets out a faint chimper as it collapses and stops moving..."

	scream_verb = "визжит"
	male_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
	female_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
	male_dying_gasp_sounds = list('sound/goonstation/voice/male_dying_gasp_1.ogg', 'sound/goonstation/voice/male_dying_gasp_2.ogg', 'sound/goonstation/voice/male_dying_gasp_3.ogg', 'sound/goonstation/voice/male_dying_gasp_4.ogg', 'sound/goonstation/voice/male_dying_gasp_5.ogg')
	female_dying_gasp_sounds = list('sound/goonstation/voice/female_dying_gasp_1.ogg', 'sound/goonstation/voice/female_dying_gasp_2.ogg', 'sound/goonstation/voice/female_dying_gasp_3.ogg', 'sound/goonstation/voice/female_dying_gasp_4.ogg', 'sound/goonstation/voice/female_dying_gasp_5.ogg')

	tail = "chimptail"
	bodyflags = HAS_TAIL
	reagent_tag = PROCESS_ORG

	unarmed_type = /datum/unarmed_attack/bite

	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5

	has_limbs = list(
		"chest" =  list("path" = /obj/item/organ/external/chest),
		"groin" =  list("path" = /obj/item/organ/external/groin),
		"head" =   list("path" = /obj/item/organ/external/head),
		"l_arm" =  list("path" = /obj/item/organ/external/arm),
		"r_arm" =  list("path" = /obj/item/organ/external/arm/right),
		"l_leg" =  list("path" = /obj/item/organ/external/leg),
		"r_leg" =  list("path" = /obj/item/organ/external/leg/right),
		"l_hand" = list("path" = /obj/item/organ/external/hand),
		"r_hand" = list("path" = /obj/item/organ/external/hand/right),
		"l_foot" = list("path" = /obj/item/organ/external/foot),
		"r_foot" = list("path" = /obj/item/organ/external/foot/right),
		"tail" =   list("path" = /obj/item/organ/external/tail/monkey))

/datum/species/monkey_stirlitz/handle_npc(mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return
	if(prob(33) && H.canmove && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		step(H, pick(GLOB.cardinal))
	if(prob(5))
		var/phrase = pick(GLOB.anekdoty_list)
		H.say("[phrase]")

/datum/species/monkey_stirlitz/get_random_name()
	return "Stirlitz ([rand(100,999)])"

/datum/species/monkey_stirlitz/on_species_gain(mob/living/carbon/human/H)
	..()
	H.real_name = "[lowertext(name)] ([rand(100,999)])"
	H.name = H.real_name
	H.butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/monkey = 5)

/datum/species/monkey/stirlitz/handle_dna(mob/living/carbon/human/H, remove)
	..()
	if(!remove)
		H.dna.SetSEState(GLOB.monkeyblock, TRUE)
		genemutcheck(H, GLOB.monkeyblock, null, MUTCHK_FORCED)

/mob/living/carbon/human/stirlitz_monkey/Initialize(mapload)
	. = ..(mapload, /datum/species/monkey_stirlitz)
	equip_to_slot(new /obj/item/clothing/under/stirlitz_monkey(src), slot_w_uniform)
	equip_to_slot(new /obj/item/clothing/head/atmta/waffen/monkey(src), slot_head)

/obj/item/clothing/under/stirlitz_monkey
	name = "fancy uniform"
	desc = "It looks like it was tailored for a monkey."
	icon_state = "stir_monk"
	item_color = "stir_monk"
	species_restricted = list("Monkey Stirlitz")
	species_exception = list(/datum/species/monkey_stirlitz)

/obj/item/clothing/head/atmta/waffen/monkey
	name = "Head of Security parade cap"
	desc = "Burn all Vulpkanins."
	icon_state = "monkey_ss"
	item_state = "hos_parade"
	species_restricted = list("Monkey Stirlitz")
	species_exception = list(/datum/species/monkey_stirlitz)