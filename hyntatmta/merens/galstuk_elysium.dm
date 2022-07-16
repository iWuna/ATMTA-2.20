/obj/item/clothing/accessory/elysium
	name = "Strange tie"
	icon = 'hyntatmta/icons/obj/clothing/ties.dmi'
	icon_state = "elysium"
	var/list/phrase_list = list("Смотри, он явно что-то задумал!","Блять, нас спалили, валим!","Да всё нормально, тихо ты.","Пока не доказано, не ебёт что сказано!","Знаешь что, давай ввалим ему!","Это... Не лучшая идея","Может добавить огоньку?","ЕБАШ КЕПАРИКА!","Давай сядем и хорошенько всё обсудим","Так, нам проблемы не нужны.","А ну-ка, покажи ему свой ствол, вдруг он заговорит иначе?","Э-э-э, нее, так просто тут не отделаешься. ")
	var/phrase_delay = 1000

/obj/item/clothing/accessory/elysium/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	if(prob(30))
		var/phrase = pick(src.phrase_list)
		to_chat(user, "<span class='name'>[name]</span> says, \"[phrase]\"")

	for(var/i in 1 to 3 step 1)
		spawn(phrase_delay * i)
			var/phrase = pick(src.phrase_list)
			to_chat(user, "<span class='name'>[name]</span> says, \"[phrase]\"")
