SWEP.Base = "weapon_swcs_base"
SWEP.Category = "Counter-Strike: Global Offensive"

SWEP.PrintName = "SCAR-20"
SWEP.Spawnable = true
SWEP.HoldType = "ar2"
SWEP.WorldModel = Model"models/weapons/csgo/w_snip_scar20_dropped.mdl"
SWEP.WorldModelPlayer = Model"models/weapons/csgo/w_snip_scar20.mdl"
SWEP.ViewModel = Model"models/weapons/csgo/v_snip_scar20.mdl"

sound.Add({
	name = "Weapon_scar20_CSGO.Single",
	channel = CHAN_STATIC,
	level = 79,
	volume = 1,
	pitch = 100,
	sound = {Sound")weapons/csgo/scar20/scar20_01.wav",Sound")weapons/csgo/scar20/scar20_02.wav",Sound")weapons/csgo/scar20/scar20_03.wav"}
})
sound.Add({
	name = "Weapon_scar20_CSGO.Draw",
	channel = CHAN_STATIC,
	level = 65,
	volume = 0.3,
	sound = Sound"weapons/csgo/scar20/scar20_draw.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.BoltBack",
	channel = CHAN_ITEM,
	level = 60,
	volume = 0.7,
	pitch = 100,
	sound = Sound"weapons/csgo/scar20/scar20_boltback.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.BoltForward",
	channel = CHAN_ITEM,
	level = 60,
	volume = 0.7,
	pitch = 100,
	sound = Sound"weapons/csgo/scar20/scar20_boltforward.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.Clipout",
	channel = CHAN_ITEM,
	level = 65,
	volume = 1,
	pitch = 100,
	sound = Sound"weapons/csgo/scar20/scar20_clipout.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.Clipin",
	channel = CHAN_ITEM,
	level = 65,
	volume = 1,
	pitch = 100,
	sound = Sound"weapons/csgo/scar20/scar20_clipin.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.WeaponMove1",
	channel = CHAN_ITEM,
	level = 65,
	volume = {0.05, .1},
	pitch = {98, 101},
	sound = Sound"weapons/csgo/movement3.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.WeaponMove2",
	channel = CHAN_ITEM,
	level = 65,
	volume = {0.05, .1},
	pitch = {98, 101},
	sound = Sound"weapons/csgo/movement2.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.WeaponMove3",
	channel = CHAN_ITEM,
	level = 65,
	volume = {0.05, .1},
	pitch = {98, 101},
	sound = Sound"weapons/csgo/movement3.wav"
})
sound.Add({
	name = "Weapon_scar20_CSGO.Zoom",
	channel = CHAN_ITEM,
	sound = Sound"weapons/csgo/scar20/zoom.wav"
})

SWEP.ItemDefAttributes = [=["attributes 07/07/2020"
{
    "magazine model"		"models/weapons/w_snip_scar20_mag.mdl"
    "primary reserve ammo max"		"90"
    "inaccuracy jump initial"		"107.690002"
    "inaccuracy jump"		"153.770004"
    "inaccuracy jump alt"		"153.770004"
    "heat per shot"		"0.350000"
    "addon scale"		"0.900000"
    "max player speed"		"215"
    "max player speed alt"		"120"
    "is full auto"		"1"
    "in game price"		"5000"
    "armor ratio"		"1.650000"
    "crosshair min distance"		"6"
    "crosshair delta distance"		"4"
    "zoom levels"		"2"
    "zoom time 0"		"0.050000"
    "zoom fov 1"		"40"
    "zoom time 1"		"0.050000"
    "zoom fov 2"		"15"
    "zoom time 2"		"0.050000"
    "hide view model zoomed"		"1"
    "penetration"		"2.500000"
    "damage"		"80"
    "range"		"8192"
    "cycletime"		"0.250000"
    "time to idle"		"1.800000"
    "idle interval"		"60"
    "flinch velocity modifier large"		"0.350000"
    "flinch velocity modifier small"		"0.400000"
    "spread"		"0.300000"
    "inaccuracy crouch"		"19.350000"
    "inaccuracy stand"		"25.799999"
    "inaccuracy land"		"0.262000"
    "inaccuracy ladder"		"116.389999"
    "inaccuracy fire"		"18.610001"
    "inaccuracy move"		"150.479996"
    "spread alt"		"0.300000"
    "inaccuracy crouch alt"		"1.500000"
    "inaccuracy stand alt"		"2.000000"
    "inaccuracy land alt"		"0.262000"
    "inaccuracy ladder alt"		"116.389999"
    "inaccuracy fire alt"		"18.610001"
    "inaccuracy move alt"		"150.479996"
    "recovery time crouch"		"0.388808"
    "recovery time stand"		"0.544331"
    "recoil angle"		"0"
    "recoil angle variance"		"30"
    "recoil magnitude"		"31"
    "recoil magnitude variance"		"4"
    "recoil seed"		"19364"
    "primary clip size"		"20"
    "weapon weight"		"20"
    "rumble effect"		"4"
    "recoil angle alt"		"0"
    "recoil angle variance alt"		"30"
    "recoil magnitude alt"		"31"
    "recoil magnitude variance alt"		"4"
    "recovery time crouch final"		"0.388808"
    "recovery time stand final"		"0.544331"
}]=]
SWEP.ItemDefVisuals = [=["visuals 07/07/2020"
{
    "muzzle_flash_effect_1st_person"		"weapon_muzzle_flash_huntingrifle"
    "muzzle_flash_effect_3rd_person"		"weapon_muzzle_flash_huntingrifle"
    "heat_effect"		"weapon_muzzle_smoke"
    "addon_location"		"primary_sniper"
    "eject_brass_effect"		"weapon_shell_casing_rifle"
    "tracer_effect"		"weapon_tracers_rifle"
    "weapon_type"		"SniperRifle"
    "player_animation_extension"		"scar20"
    "primary_ammo"		"BULLET_PLAYER_762MM"
    "sound_single_shot"		"Weapon_scar20_CSGO.Single"
    "sound_nearlyempty"		"Default.nearlyempty"
}]=]
SWEP.ItemDefPrefab = [=["prefab 08/11/2020"
{
    "zoom_in_sound"		"Weapon_scar20_CSGO.Zoom"
    "zoom_out_sound"		"Weapon_scar20_CSGO.Zoom"
}]=]
