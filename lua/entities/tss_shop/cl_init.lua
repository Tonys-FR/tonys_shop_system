include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

surface.CreateFont("tssshop_1",{
    font = "Roboto",
    extended = false,
    size = 24,
    weight = 500,
})

surface.CreateFont("tsshop_2",{
    font = "Roboto",
    extended = false,
    size = 18,
    weight = 500,
})

net.Receive("TSSSHOP::OpenDerma", function()
	
	local scrw, scrh = ScrW(), ScrH()
	local TSSDerma = vgui.Create("DFrame")
	TSSDerma:SetSize(scrw * .35, scrh * .8)
	TSSDerma:Center()
	TSSDerma:SetTitle("TONYS SHOP SYSTEM")
	TSSDerma:SetDraggable(false)
	TSSDerma:MakePopup()
	TSSDerma.Paint = function(self, w, h)
		surface.SetDrawColor(TSSSHOP.Theme["base_color"])
		surface.DrawRect(0,0,w,h)
		draw.SimpleText("TEST", "tssshop_1", w / 2, h * .02, TSSSHOP.Theme["text_color"], TEXT_ALIGN_CENTER)
	end

	local TSSScroll = vgui.Create("DScrollPanel", TSSDerma)
	TSSScroll:Dock( FILL )

	local MenuH = TSSDerma:GetTall()
	local MenuW = TSSDerma:GetWide()
	local YSpace = MenuH * .01

	for k, itemData in pairs(TSSSHOP.Items) do
		local itemsMenu = vgui.Create("DPanel", TSSScroll)
		itemsMenu:DockMargin(0, 0, 0, YSpace)
		itemsMenu:Dock(TOP)
		itemsMenu:SetTall(MenuH * .1)
		itemsMenu.Paint = function(self, w, h)
			surface.SetDrawColor(TSSSHOP.Theme["items_color"])
			surface.DrawRect(0, 0, w, h)
			draw.SimpleText("Nom: "..itemData.name, "tsshop_2", w * .3, h * .15, TSSSHOP.Theme["text_color"], TEXT_ALIGN_CENTER)
			draw.SimpleText("Desc: "..itemData.description, "tsshop_2", w * .4, h * .35, TSSSHOP.Theme["text_color"], TEXT_ALIGN_CENTER)
			draw.SimpleText("Prix "..DarkRP.formatMoney(itemData.price), "tsshop_2", w * .3, h * .55, TSSSHOP.Theme["text_color"], TEXT_ALIGN_CENTER)
		end

		local ItemIcon = vgui.Create("SpawnIcon", itemsMenu)
		ItemIcon:SetSize(80, 80)
		ItemIcon:SetPos(5,5)
		ItemIcon:SetModel(itemData.model)

		local marginSpace = MenuW * .03
		local TSSSHOPPurchase = vgui.Create("DButton", itemsMenu)
		TSSSHOPPurchase:Dock(RIGHT)
		TSSSHOPPurchase:SetWide(MenuW * .2)
		TSSSHOPPurchase:DockMargin(0, marginSpace, marginSpace, marginSpace)
		TSSSHOPPurchase:SetText("")
		TSSSHOPPurchase.Paint = function(self, w, h)
			surface.SetDrawColor(TSSSHOP.Theme["purchaseBtn"])
			surface.DrawRect(0,0,w,h)
			draw.SimpleText("ACHETER", "tsshop_2", w / 4, h / 2, TSSSHOP.Theme["text_color"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		TSSSHOPPurchase.DoClick = function()
			net.Start("TSSHOP::PurchaseWeapon")
			net.WriteInt(k, 32)
			net.SendToServer()
		end
	end
end)