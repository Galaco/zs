AddCSLuaFile()

SWEP.PrintName = "Drone"
SWEP.Description = "A deployable, remotely controlled device.\nIdeal for scouting, retrieval, and targeted attacks."

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50
	SWEP.ShowViewModel = true
	SWEP.ShowWorldModel = false

	SWEP.ViewModelBoneMods = {
		["ValveBiped.cube1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube3"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	}
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/combine_scanner.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 4, 0), angle = Angle(-54.206, 58.294, -50.114), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/combine_scanner.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 5, 0), angle = Angle(-43.978, 27.614, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_bugbait.mdl"
SWEP.WorldModel = "models/combine_scanner.mdl"
SWEP.UseHands = true

SWEP.HoldType = "grenade"

SWEP.WalkSpeed = SPEED_FAST

SWEP.AmmoIfHas = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "drone"
SWEP.Primary.Delay = 1
SWEP.Primary.DefaultClip = 1

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"

SWEP.ResupplyAmmoType = "smg1"

SWEP.WalkSpeed = SPEED_FAST

SWEP.MaxStock = 6

SWEP.DeployClass = "prop_drone"
SWEP.DeployAmmoType = "smg1"

function SWEP:Initialize()
	self:SetWeaponHoldType("grenade")
	GAMEMODE:DoChangeDeploySpeed(self)

	if CLIENT then
		self:Anim_Initialize()
	end
end

function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	for _, ent in pairs(ents.FindByClass(self.DeployClass)) do
		if ent:GetObjectOwner() == self:GetOwner() then return false end
	end

	if self:GetPrimaryAmmoCount() <= 0 then
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		return false
	end

	return true
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local owner = self:GetOwner()
	self:SendWeaponAnim(ACT_VM_THROW)
	owner:DoAttackEvent()

	self:TakePrimaryAmmo(1)
	self.NextDeploy = CurTime() + 0.75
	owner.DroneControlAmmo = self.DeployAmmoType

	if SERVER then
		local ent = ents.Create(self.DeployClass)
		if ent:IsValid() then
			ent:SetPos(owner:GetShootPos())
			ent:Spawn()
			ent:SetObjectOwner(owner)
			ent:SetupPlayerSkills()

			local stored = owner:PopPackedItem(ent:GetClass())
			if stored then
				ent:SetObjectHealth(stored[1])
			end

			ent:EmitSound("WeaponFrag.Throw")
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous(self:GetOwner():GetAimVector() * 200)
			end

			local ammotype = self.DeployAmmoType
			if ammotype then
				local ammo = math.min(owner:GetAmmoCount(ammotype), ent.MaxAmmo)
				ent:SetAmmo(ammo)
				owner:RemoveAmmo(ammo, ammotype)
			end

			if not owner:HasWeapon("weapon_zs_dronecontrol") then
				owner:Give("weapon_zs_dronecontrol")
			end
			owner:SelectWeapon("weapon_zs_dronecontrol")

			if self:GetPrimaryAmmoCount() <= 0 then
				owner:StripWeapon(self:GetClass())
			end
		end
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:CanSecondaryAttack()
	return false
end

function SWEP:Reload()
	return false
end

function SWEP:Deploy()
	GAMEMODE:WeaponDeployed(self:GetOwner(), self)

	if self:GetPrimaryAmmoCount() <= 0 then
		self:SendWeaponAnim(ACT_VM_THROW)
	end

	return true
end

function SWEP:Holster()
	self.NextDeploy = nil

	if CLIENT then
		self:Anim_Holster()
	end

	return true
end

function SWEP:Think()
	if self.NextDeploy and self.NextDeploy <= CurTime() then
		self.NextDeploy = nil

		if 0 < self:GetPrimaryAmmoCount() then
			self:SendWeaponAnim(ACT_VM_DRAW)
		else
			self:SendWeaponAnim(ACT_VM_THROW)
			if SERVER then
				self:Remove()
			end
		end
	end
end

local colBG = Color(16, 16, 16, 90)
local colWhite = Color(220, 220, 220, 230)
