structure_name = dragon_head
txt = define: %structure_name%`nstructures:
Loop, 23856
	txt .= structure_name . "_" . A_Index . ", "
Clipboard := txt
MsgBox, Done
