/obj/item/clothing/accessory/red/elysium
	name = "strange red tie"
	var/list/phrase_list = list("i'm gay!","You shitass!","Harder daddy!","Smile!")
	var/phrase_delay = 500

/obj/item/clothing/accessory/red/elysium/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	if(prob(30))
		var/phrase = pick(src.phrase_list)
		to_chat(user, "<span class='name'>[name]</span> says, \"[phrase]\"")

	for(var/i in 1 to 3 step 1)
		spawn(phrase_delay * i)
			var/phrase = pick(src.phrase_list)
			to_chat(user, "<span class='name'>[name]</span> says, \"[phrase]\"")
