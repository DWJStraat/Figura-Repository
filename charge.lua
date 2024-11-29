-- Charge
local charge_bone = models.model.root.Torso.NMCH.Head.SpellTarget -- The bone around which to generate the charge
local charge_radius = 3 -- The radius of the charge in blocks
local charge_coarsity = 0.4 --Higher = more round, more particles, slower circle. Us cautiously. Default = 0.4
local charge_decay = 0 --How many ticks a particle should disappear before being replaced by a new particle. Default = 0


local charge_active = false

function events.render()
	if charge_active then
		local charge_vector = charge_bone:partToWorldMatrix():apply()
		local charge_x = math.random()*2-1
		local charge_y = math.random()*2-1
		local charge_z = math.random()
		local pos = charge_vector + orbit(charge_radius, 1, charge_x, charge_y, charge_z)
		local direction = pos - charge_vector
		particles:newParticle('minecraft:enchant', pos, direction):setLifetime(20)
	end
end 

ParticlePage:newAction():title("Charge"):item("minecraft:fire_charge"):toggled(false):onToggle(function(state, self)
	pings.toggleCharge(state)
  end)
  
function pings.toggleCharge(bool)
	charge_active = bool
end
