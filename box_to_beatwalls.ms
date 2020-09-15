global struct_name = "dragon_head"
global struct_counter = 1
global defined_struct = "\ndefine: " + struct_name + "\n structures: "
global walls_struct = ""

function rot &x1 &y1 x2 y2 ang =
(
	local x = x2 + (x1 - x2) * cos(ang) - (y1 - y2) * sin(ang)
	local y = y2 + (x1 - x2) * sin(ang) + (y1 - y2) * cos(ang)
	x1 = x
	y1 = y
	return true
)

for obj in $box* do
(
	local obj_r_x = in coordsys gimbal obj.rotation.x_rotation
	local obj_r_y = in coordsys gimbal obj.rotation.y_rotation
	local obj_r_z = in coordsys gimbal obj.rotation.z_rotation
	local or_x = obj.pos.x - obj.width*obj.scale.x/2
	local or_y = obj.pos.y
	local or_z = obj.pos.z
	rot &or_z &or_x obj.pos.z obj.pos.x obj_r_y
	rot &or_x &or_y obj.pos.x obj.pos.y obj_r_z
	local wStartx = or_x
	local wStarty = or_y - obj.length*obj.scale.y/2
	local wStartz = or_z

	defined_struct = defined_struct + ", " + struct_name + "_" + ((struct_counter) as string)

	walls_struct += "\ndefine: "+struct_name+"_"+((struct_counter) as string)+"\n"
	walls_struct += " structures: wall\n"
	walls_struct += " startRow: "+(wStarty*25.4/1000) as string+"\n"
	walls_struct += " startTime: "+(wStartx*25.4/1000) as string+"\n"
	walls_struct += " startHeight: "+(wStartz*25.4/1000) as string+"\n"
	walls_struct += " height: "+(obj.height*25.4*obj.scale.z/1000) as string+"\n"
	walls_struct += " width: "+(obj.length*25.4*obj.scale.y/1000) as string+"\n"
	walls_struct += " duration: "+(obj.width*25.4*obj.scale.x/1000) as string+"\n"
	walls_struct += " color: "+((Integer obj.wirecolor.r) as string)+", "+((Integer obj.wirecolor.g) as string)+", "+((Integer obj.wirecolor.b) as string)+"\n"
	walls_struct += " localRotZ: "+(obj_r_x as string)+"\n"
	walls_struct += " localRotX: "+(obj_r_y as string)+"\n"
	walls_struct += " localRotY: "+(obj_r_z as string)+"\n"
	struct_counter = struct_counter + 1
)

format "%\n\n%" walls_struct defined_struct
a=1
