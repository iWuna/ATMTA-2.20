/obj/item/clothing/accessory/red/elysium
	name = "strange red tie"
	var/phrase = list("hui","pizda")

/obj/item/clothing/accessory/red/elysium/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	if(prob(30))
		to_chat(user, "[phrase]")