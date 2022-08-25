;###TODO
;finish addons tab
;finish offerings tab
;finish search algo
;add perks? checkbox
;add event items checkbox


IniRead, PFlash, %A_ScriptDir%\src\lib\Settings.ini, Items, PFlash
IniRead, GFlash, %A_ScriptDir%\src\lib\Settings.ini, Items, GFlash
IniRead, YFlash, %A_ScriptDir%\src\lib\Settings.ini, Items, YFlash
IniRead, PMed, %A_ScriptDir%\src\lib\Settings.ini, Items, PMed
IniRead, GMed, %A_ScriptDir%\src\lib\Settings.ini, Items, GMed
IniRead, YMed, %A_ScriptDir%\src\lib\Settings.ini, Items, YMed
IniRead, BMed, %A_ScriptDir%\src\lib\Settings.ini, Items, BMed
;### INITIALIZE SETTINGS
IniRead, PEBox, %A_ScriptDir%\src\lib\Settings.ini, Items, PEBox
IniRead, PABox, %A_ScriptDir%\src\lib\Settings.ini, Items, PABox
IniRead, PMBox, %A_ScriptDir%\src\lib\Settings.ini, Items, PMBox
IniRead, PCBox, %A_ScriptDir%\src\lib\Settings.ini, Items, PCBox
IniRead, YBox, %A_ScriptDir%\src\lib\Settings.ini, Items, YBox
IniRead, BBox, %A_ScriptDir%\src\lib\Settings.ini, Items, BBox
;### INITIALIZE SETTINGS
IniRead, PiKey, %A_ScriptDir%\src\lib\Settings.ini, Items, PiKey
IniRead, PKey, %A_ScriptDir%\src\lib\Settings.ini, Items, PKey
IniRead, GKey, %A_ScriptDir%\src\lib\Settings.ini, Items, GKey
IniRead, PMap, %A_ScriptDir%\src\lib\Settings.ini, Items, PMap
IniRead, GMap, %A_ScriptDir%\src\lib\Settings.ini, Items, GMap

Gui, Add, Button, x311 y420 Default gStart, Start
Gui, Add,Tab3,x10 y10 w340 h405 ,Items|Addons|Offerings ;create a tab control Flashlight|Medkit|Toolbox|Key|Map
Gui, Font, S15 cRed Bold, Verdana
Gui, Color, c9c9c9
check := Chr(0x2714) ; ✔
x := Chr(0x2716) ; ✖
;### ITEMS START
;### COLUMN 1 BUTTONS
Gui, Add, Button, w48 h48 gPFlashB vPFlashB
Gui, Add, Button, w48 h48 gGFlashB vGFlashB
Gui, Add, Button, w48 h48 gYFlashB vYFlashB
Gui, Add, Button, w48 h48 gPMedB vPMedB
Gui, Add, Button, w48 h48 gGMedB vGMedB
Gui, Add, Button, w48 h48 gYMedB vYMedB
Gui, Add, Button, w48 h48 gBMedB vBMedB
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38, %A_ScriptDir%\src\Item\Flashlight\Purple.png
Gui, Add, Pic, w48 h48 x75 y92, %A_ScriptDir%\src\Item\Flashlight\Green.png
Gui, Add, Pic, w48 h48 x75 y145, %A_ScriptDir%\src\Item\Flashlight\Yellow.png
Gui, Add, Pic, w48 h48 x75 y200, %A_ScriptDir%\src\Item\Medkit\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Medkit\Brown.png
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48 gPEBoxB vPEBoxB
Gui, Add, Button, w48 h48 gPABoxB vPABoxB
Gui, Add, Button, w48 h48 gPMBoxB vPMBoxB
Gui, Add, Button, w48 h48 gPCBoxB vPCBoxB
Gui, Add, Button, w48 h48 gYBoxB vYBoxB
Gui, Add, Button, w48 h48 gBBoxB vBBoxB
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38, %A_ScriptDir%\src\Item\Toolbox\PurpleEngi.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\PurpleAlex.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenMech.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\GreenCom.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Yellow.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Toolbox\Brown.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48 gPiKeyB vPiKeyB
Gui, Add, Button, w48 h48 gPKeyB vPKeyB
Gui, Add, Button, w48 h48 gGKeyB vGKeyB
Gui, Add, Button, w48 h48 gPMapB vPMapB
Gui, Add, Button, w48 h48 gGMapB vGMapB
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38, %A_ScriptDir%\src\Item\Key\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Purple.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Key\Green.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Pink.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Item\Map\Green.png
Update_Item_Buttons(PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PEBox,PABox,PMBox,PCBox,YBox,BBox,PiKey,PKey,GKey,PMap,GMap)
;### ITEMS END
Gui,Tab,Addons
;### ADDONS START
Gui,Show
Return
Start:
Return

PFlashB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PFlashB, %ch%
    PFlash := Toggle_Val(PFlash)
Return
GFlashB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, GFlashB, %ch%
    GFlash := Toggle_Val(GFlash)
Return
YFlashB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, YFlashB, %ch%
    YFlash := Toggle_Val(YFlash)
Return
PMedB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PMedB, %ch%
    PMed := Toggle_Val(PMed)
Return
GMedB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, GMedB, %ch%
    GMed := Toggle_Val(GMed)
Return
YMedB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, YMedB, %ch%
    YMed := Toggle_Val(YMed)
Return
BMedB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, BMedB, %ch%
    BMed := Toggle_Val(BMed)
Return
PEBoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PEBoxB, %ch%
    PEBox := Toggle_Val(PEBox)
Return
PABoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PABoxB, %ch%
    PABox := Toggle_Val(PABox)
Return
PMBoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PMBoxB, %ch%
    PMBox := Toggle_Val(PMBox)
Return
PCBoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PCBoxB, %ch%
    PCBox := Toggle_Val(PCBox)
Return
YBoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, YBoxB, %ch%
    YBox := Toggle_Val(YBox)
Return
BBoxB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, BBoxB, %ch%
    BBox := Toggle_Val(BBox)
Return
PiKeyB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PiKeyB, %ch%
    PiKey := Toggle_Val(PiKey)
Return
PKeyB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PKeyB, %ch%
    PKey := Toggle_Val(PKey)
Return
GKeyB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, GKeyB, %ch%
    GKey := Toggle_Val(GKey)
Return
PMapB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, PMapB, %ch%
    PMap := Toggle_Val(PMap)
Return
GMapB:
    GuiControlGet, ch,, % A_GuiControl
    ch := Toggle_Char(ch)
    GuiControl ,, GMapB, %ch%
    GMap := Toggle_Val(GMap)
Return

guiclose:
    Ini_Write_Items(PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PEBox,PABox,PMBox,PCBox,YBox,BBox,PiKey,PKey,GKey,PMap,GMap)
    ExitApp
Return

Ini_Write_Items(PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PEBox,PABox,PMBox,PCBox,YBox,BBox,PiKey,PKey,GKey,PMap,GMap) {
    IniWrite, %PFlash%, %A_ScriptDir%\src\lib\Settings.ini, Items, PFlash
    IniWrite, %GFlash%, %A_ScriptDir%\src\lib\Settings.ini, Items, GFlash
    IniWrite, %YFlash%, %A_ScriptDir%\src\lib\Settings.ini, Items, YFlash
    IniWrite, %PMed%, %A_ScriptDir%\src\lib\Settings.ini, Items, PMed
    IniWrite, %GMed%, %A_ScriptDir%\src\lib\Settings.ini, Items, GMed
    IniWrite, %YMed%, %A_ScriptDir%\src\lib\Settings.ini, Items, YMed
    IniWrite, %BMed%, %A_ScriptDir%\src\lib\Settings.ini, Items, BMed
    IniWrite, %PEBox%, %A_ScriptDir%\src\lib\Settings.ini, Items, PEBox
    IniWrite, %PABox%, %A_ScriptDir%\src\lib\Settings.ini, Items, PABox
    IniWrite, %PMBox%, %A_ScriptDir%\src\lib\Settings.ini, Items, PMBox
    IniWrite, %PCBox%, %A_ScriptDir%\src\lib\Settings.ini, Items, PCBox
    IniWrite, %YBox%, %A_ScriptDir%\src\lib\Settings.ini, Items, YBox
    IniWrite, %BBox%, %A_ScriptDir%\src\lib\Settings.ini, Items, BBox
    IniWrite, %PiKey%, %A_ScriptDir%\src\lib\Settings.ini, Items, PiKey
    IniWrite, %PKey%, %A_ScriptDir%\src\lib\Settings.ini, Items, PKey
    IniWrite, %GKey%, %A_ScriptDir%\src\lib\Settings.ini, Items, GKey
    IniWrite, %PMap%, %A_ScriptDir%\src\lib\Settings.ini, Items, PMap
    IniWrite, %GMap%, %A_ScriptDir%\src\lib\Settings.ini, Items, GMap
}

Update_Item_Buttons(PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PEBox,PABox,PMBox,PCBox,YBox,BBox,PiKey,PKey,GKey,PMap,GMap) {
    ch := Set_Char(PFlash)
    GuiControl ,, PFlashB, %ch%
    ch := Set_Char(GFlash)
    GuiControl ,, GFlashB, %ch%
    ch := Set_Char(YFlash)
    GuiControl ,, YFlashB, %ch%
    ch := Set_Char(PMed)
    GuiControl ,, PMedB, %ch%
    ch := Set_Char(GMed)
    GuiControl ,, GMedB, %ch%
    ch := Set_Char(YMed)
    GuiControl ,, YMedB, %ch%
    ch := Set_Char(BMed)
    GuiControl ,, BMedB, %ch%
    ch := Set_Char(PEBox)
    GuiControl ,, PEBoxB, %ch%
    ch := Set_Char(PABox)
    GuiControl ,, PABoxB, %ch%
    ch := Set_Char(PMBox)
    GuiControl ,, PMBoxB, %ch%
    ch := Set_Char(PCBox)
    GuiControl ,, PCBoxB, %ch%
    ch := Set_Char(YBox)
    GuiControl ,, YBoxB, %ch%
    ch := Set_Char(BBox)
    GuiControl ,, BBoxB, %ch%
    ch := Set_Char(PiKey)
    GuiControl ,, PiKeyB, %ch%
    ch := Set_Char(PKey)
    GuiControl ,, PKeyB, %ch%
    ch := Set_Char(GKey)
    GuiControl ,, GKeyB, %ch%
    ch := Set_Char(PMap)
    GuiControl ,, PMapB, %ch%
    ch := Set_Char(GMap)
    GuiControl ,, GMapB, %ch%
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