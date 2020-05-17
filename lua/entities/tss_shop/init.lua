AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("TSSSHOP::OpenDerma")

function ENT:Initialize()
	self:SetModel("models/gman_high.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetBloodColor(BLOOD_COLOR_RED)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE, CAP_TURN_HEAD)
	self:SetMaxYawSpeed(90)
	self:DropToFloor()
end

function ENT:SpawnFunction(ply, tr, class)
	if not tr.Hit then return end
	
	local spawnAng = ply:EyeAngles()
	spawnAng.p = 0
	spawnAng.y = spawnAng.y + 180

	local ent = ents.Create(class)
	ent:SetPos(tr.HitPos + tr.HitNormal * 16)
	ent:SetAngles(spawnAng)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:AcceptInput(name, activator, caller)
	if name == "Use" and caller:IsPlayer() then
		net.Start("TSSSHOP::OpenDerma")
		net.Send(caller)
	end
end