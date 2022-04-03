/datum/job/prisoner
	title = "D-Class Prisoner"
	flag = JOB_DCLASS
	department_flag = JOBCAT_SUPPORT
	total_positions = -1
	spawn_positions = -1
	supervisors = "security officers"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/prisoner

/datum/outfit/job/prisoner
	name = "D-Class"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/orange
	r_hand = /obj/item/storage/box/survival/prisoner
	l_ear = /obj/item/clothing/mask/cigarette/random
	pda = /obj/item/pda/prisoner
