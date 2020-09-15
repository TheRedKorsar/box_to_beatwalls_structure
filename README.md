# Box to beatwalls structure
<br>
This script making code for beatwalls structures.<br>
So that one is not so easy to use for now.<br>
This script contain 3 parts:<br>

> box_to_beatwalls.ms

That file is requered some steps to use:<br>
- Open script itself
- Change struct_name to what ever you want to name a structure and save
- Open MAXScript Listener (press F11)
- Clear it out if something there
- Run script
- Copy all code
- Paste it in BW file you working on

> box_to_beatwallsF.ms

This script created for large structures, it will write files to export folder of 3ds max.<br>
In process of exporting, 3dsmax may crash with error. So this script for this purpose.<br>
- Make sure to save your boxmodel before processing
- Open script itself
- Change struct_name to what ever you want to name a structure and save
- Run script
- If error appear:
   - Close max
   - Go to export repository
   - Find last created file
   - Open script
   - enter last number of file to end_point variable (f.e. dragon_head_13.bw I have to write global end_point = 13)
   - Open 3ds max 
   - Load your scene
   - Run script again
   - Repeat "If error appear" steps
- Go to export repository
- Now you have to manualy collect data from all files to one bw file
- For structure definition I have autohotkey script

> definition.ahk

For this to work you have to install AutoHotKey<br>
If you have it, so there is another stack of steps:
- Open script with notepad
- Change structure_name to yours
- Change number in line with Loop command to what avere walls you have in structure
- Save/run script
- After MsgBox with Done message appear, your code is in clipboard
- Open bw file and paste it after stack of walls
