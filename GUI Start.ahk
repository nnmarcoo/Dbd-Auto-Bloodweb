;###TODO
;finish addons tab
;finish offerings tab
;finish search algo
;add perks? checkbox
;add event items checkbox

Global Items := Initialize("Items")
Gui, Add, Button, x311 y420 Default gStart, Start
Gui, Add,Tab3,x10 y10 w340 h405 ,Items|Addons|Offerings ;create a tab control Flashlight|Medkit|Toolbox|Key|Map
Gui, Font, S15 cRed Bold, Verdana
Gui, Color, c9c9c9
check := Chr(0x2714) ; ✔
x := Chr(0x2716) ; ✖
;### ITEMS START
;### COLUMN 1 BUTTONS
Gui, Add, Button, w48 h48 gonClick vPFlashB
Gui, Add, Button, w48 h48 gonClick vGFlashB
Gui, Add, Button, w48 h48 gonClick vYFlashB
Gui, Add, Button, w48 h48 gonClick vPMedB
Gui, Add, Button, w48 h48 gonClick vGMedB
Gui, Add, Button, w48 h48 gonClick vYMedB
Gui, Add, Button, w48 h48 gonClick vBMedB
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38, %A_ScriptDir%\src\Item\Flashlight\Purple.png
Gui, Add, Pic, w48 h48 x75 y92, %A_ScriptDir%\src\Item\Flashlight\Green.png
Gui, Add, Pic, w48 h48 x75 y145, %A_ScriptDir%\src\Item\Flashlight\Yellow.png
Gui, Add, Pic, w48 h48 x75 y200, %A_ScriptDir%\src\Item\Medkit\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Brown.png
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48 gonClick vPEBoxB
Gui, Add, Button, w48 h48 gonClick vPABoxB
Gui, Add, Button, w48 h48 gonClick vPMBoxB
Gui, Add, Button, w48 h48 gonClick vPCBoxB
Gui, Add, Button, w48 h48 gonClick vYBoxB
Gui, Add, Button, w48 h48 gonClick vBBoxB
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38, %A_ScriptDir%\src\Item\Toolbox\PurpleEngi.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\PurpleAlex.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenMech.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenCom.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Brown.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48 gonClick vPiKeyB
Gui, Add, Button, w48 h48 gonClick vPKeyB
Gui, Add, Button, w48 h48 gonClick vGKeyB
Gui, Add, Button, w48 h48 gonClick vPMapB
Gui, Add, Button, w48 h48 gonClick vGMapB
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38, %A_ScriptDir%\src\Item\Key\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Green.png
Update_Buttons(Items)
;### ITEMS END
Gui,Tab,Addons
;### ADDONS START
Gui,Show
Return
Start:
Return

onClick() {
    GuiControlGet, ch,, % A_GuiControl ; get state of button
    ch := Toggle_Char(ch) ; prepare to toggle state
    GuiControl ,, %A_GuiControl%, %ch% ; toggle state of button


    ; add if var in Items, do this
    Item := SubStr(A_GuiControl, 1, StrLen(A_GuiControl)-1) ; set Item to refrence in dictionary
    Items[Item] := Toggle_Val(Items[Item]) ; toggle value in dictionary
}

guiclose:
    Ini_Write("Items")
    ExitApp
Return

Ini_Write(Category) { ; pass in the name of the dictionary
    for key, value in %Category%
        IniWrite, %value%, %A_ScriptDir%\src\lib\Settings.ini, %Category%, %key%
}

Update_Buttons(Buttons) {
    for key, value in Buttons {
        ch := Set_Char(Buttons[key])
        key := key . "B"
        GuiControl ,, %key%, %ch%
    }
}

Toggle_Char(ch) {
    if (ch = Chr(0x2714))
        return Chr(0x2716)
    return Chr(0x2714)
}

Set_Char(x) {
    if (x = 0)
        return Chr(0x2716)
    return Chr(0x2714)
}

Toggle_Val(x) {
    if (x = 0)
        return 1
    return 0
}

Obj2Str(obj) 
{
	For k,v in obj
		Str .= k " = " v "`n"
	return RTrim(Str, "`n")
}

Initialize(Category) {
    out := {}
    IniRead, var, %A_ScriptDir%\src\lib\Settings.ini, %Category%
    For each, line in StrSplit(var, "`n")
    part := StrSplit(line, "="), out[part.1] := part.2
    return out
}