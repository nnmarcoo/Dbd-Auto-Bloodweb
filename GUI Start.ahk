Gui,Add,Tab3,x10 y10 w335 h200 ,Flashlight|Medkit|Toolbox|Key|Map|Offerings|Start ;create a tab control
Gui,Color, c9c9c9

my_picturefile = C:\Users\marco\Documents\GitHub\Dbd-Auto-Perks\src\Item\Flashlight\Green.png
FileInstall, icon22.png, %my_picturefile%, 1
Gui, Add, Picture,w256 h256, %my_picturefile%

Gui,Show