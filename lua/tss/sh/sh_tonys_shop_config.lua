TSSSHOP = TSSSHOP or {}

TSSSHOP.Theme = {
	["base_color"] = Color(0,0,0,200),
	["items_color"] = Color(255,255,255),
	["text_color"] = Color(0,0,0),
	["purchaseBtn"] = Color(153,153,255,255),
}

--[[Exemple add new items for sell on the shop]]

--[[
{
		name = "Deagle", - name weapons
		classname = "weapon_deagle2", -- class weapons exemple fas_glock or m9k_glock 
		model = "models/weapons/cstrike/c_pist_deagle.mdl", -- view model weapons
		price = 1000, -- sell price on the shop
		description = "Cette armes est de type revolover." -- description view on shop 
	},

--]]

TSSSHOP.Items = {

	{
		name = "Deagle",
		classname = "weapon_deagle2",
		model = "models/weapons/cstrike/c_pist_deagle.mdl",
		price = 1000,
		description = "Cette armes est de type revolover."
	},
	{
		name = "Glock",
		classname = "weapon_glock2",
		model = "models/weapons/cstrike/c_pist_glock18.md",
		price = 800,
		description = "Cette armes est de type pistol."
	},
	{
		name = "MP5",
		classname = "weapon_mp52",
		model = "models/weapons/cstrike/c_smg_mp5.mdl",
		price = 5000,
		description = "Cette armes est de type assault."
	},
}