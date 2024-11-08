-- Orbit
local orbit_bone = models.model.root.Torso.NMCH.Head.SpellTarget -- The bone around which to generate the orbit
local orbit_radius = 1 -- The radius of the orbit in blocks
local orbit_coarsity = 0.4 --Higher = more round, more particles, slower circle. Us cautiously. Default = 0.4


local orbit_counter = 0
local max_counter = 2*math.pi
local particle_duration = max_counter/orbit_coarsity
local orbit_active = true

function events.tick()
	if orbit_active then
		local orbit_vector = orbit_bone:partToWorldMatrix():apply()
		orbit_counter = orbit_counter + orbit_coarsity
		if orbit_counter >= max_counter then
			orbit_counter = 0
		end
		particles:newParticle('minecraft:flame',orbit_vector + orbit(orbit_radius, orbit_counter, 1, 0, 1)):setLifetime(particle_duration)
	end
end 

ParticlePage:newAction():title("Orbit"):item("minecraft:fire_charge"):toggled(false):onToggle(function(state, self)
	pings.toggleOrbit(state)
  end)
  
function pings.toggleOrbit(bool)
	orbit_active = bool
end
