function orbit(radius, t, x_multiplier, y_multiplier, z_multiplier)
	new_z = radius*math.cos(t)*z_multiplier
	new_y = radius*math.cos(t)*y_multiplier
	new_x = radius*math.sin(t)*x_multiplier
	return vec(new_x, new_y, new_z)
end

function vertical_helix(radius,t)
	new_z = radius*math.cos(t)
	new_x = radius*math.sin(t)
	new_y = radius*math.tan(t)
	return vec(new_x, 0, new_z)
end

function randomOffset(vector) 
    out_x = vector.x + (radius * 2) * (math.random() - 0.5)
    out_y = vector.y 
    out_z = vector.z + (radius * 2) * (math.random() - 0.5)
    return vec(out_x, out_y, out_z)
end
