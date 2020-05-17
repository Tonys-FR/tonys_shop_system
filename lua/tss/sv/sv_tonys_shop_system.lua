
if SERVER then
util.AddNetworkString("TSSHOP::PurchaseWeapon")

net.Receive("TSSHOP::PurchaseWeapon", function(len, ply)
	
	local id = net.ReadInt(32)
	local itemsData = TSSSHOP.Items[id]

	if not itemsData then return end
	
	local canAfford = ply:canAfford(itemsData.price)
	if not canAfford then 
		DarkRP.notify(ply, 1, 5, "[Tonys Shop System]".." Tu ne peut pas acheter cette arme, tu na pas assez d'argent.")
		return
	end

	ply:addMoney(-itemsData.price)
	ply:Give(itemsData.classname)
	DarkRP.notify(ply, 0, 5, "[Tonys Shop System]".." Vous avez effectuer votre achat, vous avez reçus votre "..itemsData.name)
end)
end