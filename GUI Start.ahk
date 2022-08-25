Gui, Add, Button, x311 y420 Default gStart, Start
Gui,Add,Tab3,x10 y10 w340 h405 ,Items|Offerings ;create a tab control Flashlight|Medkit|Toolbox|Key|Map
Gui, Font, S15 cRed Bold, Verdana
Gui,Color, c9c9c9
check := Chr(0x2714) ; ✔
x := Chr(0x2716) ; ✖

;### COLUMN 1 BUTTONS
Gui, Add, Button, w48 h48, %check%
Gui, Add, Button, w48 h48, %check%
Gui, Add, Button, w48 h48, %check%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38, %A_ScriptDir%\src\Item\Flashlight\Purple.png
Gui, Add, Pic, w48 h48 x75 y92, %A_ScriptDir%\src\Item\Flashlight\Green.png
Gui, Add, Pic, w48 h48 x75 y145, %A_ScriptDir%\src\Item\Flashlight\Yellow.png
Gui, Add, Pic, w48 h48 x75 y200, %A_ScriptDir%\src\Item\Medkit\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Brown.png
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38, %A_ScriptDir%\src\Item\Toolbox\PurpleEngi.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\PurpleAlex.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenMech.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenCom.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Brown.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
Gui, Add, Button, w48 h48, %x%
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38, %A_ScriptDir%\src\Item\Key\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Green.png


Gui,Show


Start:
Return

Return
guiclose:
ExitApp