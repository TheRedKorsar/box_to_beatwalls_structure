global struct_name = "dragon_head"
global struct_counter = 1
global max_wall = 1000
global walls_now = 0
global file_post = 1
global end_point = 1

function rot &x1 &y1 x2 y2 ang =
(
	local x = x2 + (x1 - x2) * cos(ang) - (y1 - y2) * sin(ang)
	local y = y2 + (x1 - x2) * sin(ang) + (y1 - y2) * cos(ang)
	x1 = x
	y1 = y
	return true
)
out_name = ((GetDir #export)+"/"+(struct_name as string)+"_"+(end_point as string)+".bw")
out_file = createfile out_name
for obj in $box* do
(
	if file_post >= end_point then
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

		format "\ndefine: %_%\n" struct_name ((struct_counter) as string) to:out_file
		format " structures: wall\n" to:out_file
		format " startRow: %\n" (wStarty*25.4/1000) to:out_file
		format " startTime: %\n" (wStartx*25.4/1000) to:out_file
		format " startHeight: %\n" (wStartz*25.4/1000) to:out_file
		format " height: %\n" (obj.height*25.4*obj.scale.z/1000) to:out_file
		format " width: %\n" (obj.length*25.4*obj.scale.y/1000) to:out_file
		format " duration: %\n" (obj.width*25.4*obj.scale.x/1000) to:out_file
		format " color: %, %, %\n" ((Integer obj.wirecolor.r) as string) ((Integer obj.wirecolor.g) as string) ((Integer obj.wirecolor.b) as string) to:out_file
		format " localRotZ: %\n" (obj_r_x as string) to:out_file
		format " localRotX: %\n" (obj_r_y as string) to:out_file
		format " localRotY: %\n" (obj_r_z as string) to:out_file
	)
	struct_counter = struct_counter + 1
	walls_now = walls_now + 1
	if walls_now > max_wall then
	(
		walls_now = 0
		file_post = file_post + 1
		if file_post >= end_point then
		(
			close out_file
			out_name = ((GetDir #export)+"/dragon_full_"+(file_post as string)+".bw")
			out_file = createfile out_name
		)
	)
)
close out_file
