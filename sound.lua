-- BEEP BEEP
local generator_part = models.model.root.Torso.NMCH.Head.SpellTarget -- the part from which the sound emanates. Shouldn't be that important.
local sound = 'entity.evoker.prepare_wololo' -- the sound to play
ParticlePage:newAction():title("Sound"):item("minecraft:feather"):toggled(false):onLeftClick(function(state, self)
	sounds:playSound(sound, generator_part:partToWorldMatrix():apply())
		:volume(100)
  end)
