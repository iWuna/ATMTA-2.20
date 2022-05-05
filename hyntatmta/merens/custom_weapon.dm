/obj/item/gun/projectile/automatic/pistol/m1911/engraved
	name = "\improper Engraved M1911"
	desc = "Кольт 1911, калибра .45, выглядит как новый. Тут выгравировано \"Смерть Вульпам\"."
	icon_state = "m1911_f"
	mag_type = /obj/item/ammo_box/magazine/m45/fire

/obj/item/ammo_box/magazine/m45/fire
	name = "handgun magazine (.45 incendiary)"
	icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45/fire
	caliber = ".45"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_casing/c45/fire
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/incendiary/firebullet
	muzzle_flash_strength = MUZZLE_FLASH_STRENGTH_NORMAL
	muzzle_flash_range = MUZZLE_FLASH_RANGE_NORMAL
	materials = list(MAT_METAL=1200)

/obj/item/storage/box/syndie_kit/m1911
	name = "Incendiary colt 1911 kit"

/obj/item/ammo_box/magazine/m45/fire
	name = "pistol magazine (.45 incendiary)"
	icon_state = "9x19pI"
	desc = "A gun magazine. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c45/fire

/datum/syndie_supply_packs/security/coltincendiary
	name = "Colt 1911 - .45 Incendiary Magazine"
	contains = list(/obj/item/ammo_box/magazine/m45/fire,
					/obj/item/ammo_box/magazine/m45/fire,
					/obj/item/ammo_box/magazine/m45/fire
					)
	cost = 500
	containername = "Colt 1911 - Incendiary Magazine crate"

/datum/uplink_item/ammo/coltincendiary
	name = "Colt 1911 - .45 Incendiary Magazine"
	desc = "An additional 8-round .45 magazine for use in the colt 1911 pistol, loaded with incendiary rounds which ignite the target."
	reference = "45MMFIRE"
	item = /obj/item/ammo_box/magazine/m45/fire
	cost = 2

/datum/uplink_item/dangerous/colt
	name = "\improper Engraved Colt M1911"
	reference = "SPI"
	desc = "A shiny and cool-looking handgun that uses .45 in 8-round magazines.."
	item = /obj/item/gun/projectile/automatic/pistol/m1911/engraved
	cost = 5