-- AURA
local generator_part = models.model.root.Torso.NMCH.Head.SpellTarget -- the point that generates the particles
local model_root = models.model.root -- the path to the "model"
local radius = 1 -- how many blocks from the generator_part to generate particles
local water_cooldown = 1 -- the cooldown on particle generation in ticks while in the water (bubbles)
local air_cooldown = 1 -- the cooldown on particle generation in ticks while in the air (swirls)
local earth_cooldown = 1 -- the cooldown on particle generation in ticks while on the ground (flames)
local particle_duration = 40 -- how many ticks a particle lasts
local particle_size = 0.4 -- the size of the particle. 1 is default

function randomOffset(vector) 
    out_x = vector.x + (radius * 2) * (math.random() - 0.5)
    out_y = vector.y 
    out_z = vector.z + (radius * 2) * (math.random() - 0.5)
    return vec(out_x, out_y, out_z)
end

local aura = false
counter = 0
function events.tick()
	counter = counter + 1 
	local part_vector = generator_part:partToWorldMatrix():apply()
	local auraPos = randomOffset(part_vector)
	local scale_offset = model_root:getScale().y
	if aura then
			if (counter >= water_cooldown and player:isInWater()) then
			particles:newParticle('bubble_column_up', auraPos - vec(0,scale_offset,0))
				:setColor(1,1,1)
				:setSize(particle_size)
				:setLifetime(particle_duration)
				:setGravity(-0.05)
        counter = 0
		else if (counter >= earth_cooldown and player:isOnGround()) then
			particles:newParticle('flame', auraPos)
				:setColor(1,1,1)
				:setSize(particle_size)
				:setLifetime(particle_duration)
				:setGravity(0.05)
        counter = 0
			else if counter >= air_cooldown then
				particles:newParticle('effect', auraPos)
					:setSize(particle_size)
					:setLifetime(particle_duration)
          counter = 0
			end
		end
		end
		
	end
	end


ParticlePage:newAction():title("Elemental Aura"):item("minecraft:fire_charge"):toggled(false):onToggle(function(state, self)
  pings.toggleAura(state)
end)

function pings.toggleAura(bool)
	aura = bool
end
