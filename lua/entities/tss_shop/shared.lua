ENT.Type = "ai"
ENT.Base = "base_ai"

ENT.PrintName = "[TSS SHOP]"
ENT.Category = "[TSS]"
ENT.Author = "Tonys"

ENT.Contact = "Tonys-#9455"
ENT.Purpose = "Simple shop"
ENT.Instructions = "Press 'E' to open shop"

ENT.Spawnable = true
ENT.AdminOnly = true
ENT.AutomaticFrameAdvance = true

function ENT:SetupDataTables()
	--self:NetworkVar("Entity", 0, "owning_ent")
end

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end