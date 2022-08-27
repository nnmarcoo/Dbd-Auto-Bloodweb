;###TODO
;finish addons tab
;finish offerings tab
;finish search algo
;add perks? checkbox
;add event items checkbox
;add pages for addons and offerings tab using buttons

Global Items := Initialize("Items")
Global Addons := Initialize("Addons")
Global AddonsPage := 0
Global OfferingsPage := 0
Gui, Add, Button, x311 y420 Default gStart, Start
Gui, Add,Tab3,x10 y10 w340 h405 vTabName gTabChange,Items|Addons|Offerings ;create a tab control Flashlight|Medkit|Toolbox|Key|Map
Gui, Font, S15 cRed Bold, Verdana
Gui, Color, c9c9c9

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
;### ADDONS START --- PAGE 1
Gui, Add, Button, w48 h48 gonClick vPiBulbB
Gui, Add, Button, w48 h48 gonClick vPLensB
Gui, Add, Button, w48 h48 gonClick vGBatB
Gui, Add, Button, w48 h48 gonClick vGBulbB
Gui, Add, Button, w48 h48 gonClick vYFilaB
Gui, Add, Button, w48 h48 gonClick vYBatB
Gui, Add, Button, w48 h48 gonPage vAddonsB, 🢀
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38 vPiBulbI, %A_ScriptDir%\src\Addon\Flashlight\PiBulb.png
Gui, Add, Pic, w48 h48 x75 y92 vPLensI, %A_ScriptDir%\src\Addon\Flashlight\PLens.png
Gui, Add, Pic, w48 h48 x75 y145 vGBatI, %A_ScriptDir%\src\Addon\Flashlight\GBat.png
Gui, Add, Pic, w48 h48 x75 y200 vGBulbI, %A_ScriptDir%\src\Addon\Flashlight\GBulb.png
Gui, Add, Pic, w48 h48 vYFilaI, %A_ScriptDir%\src\Addon\Flashlight\YFila.png
Gui, Add, Pic, w48 h48 vYBatI, %A_ScriptDir%\src\Addon\Flashlight\YBat.png
;Gui, Add, Pic, w48 h48,
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48 gonClick vYGripB
Gui, Add, Button, w48 h48 gonClick vYOpticB
Gui, Add, Button, w48 h48 gonClick vYLensB
Gui, Add, Button, w48 h48 gonClick vBBatB
Gui, Add, Button, w48 h48 gonClick vBBulbB
Gui, Add, Button, w48 h48 gonClick vBLensB
Gui, Add, Button, w48 h48 gonClick vYSpongeB ;extra button
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38 vYGripI, %A_ScriptDir%\src\Addon\Flashlight\YGrip.png
Gui, Add, Pic, w48 h48 vYOpticI, %A_ScriptDir%\src\Addon\Flashlight\YOptic.png
Gui, Add, Pic, w48 h48 vYLensI, %A_ScriptDir%\src\Addon\Flashlight\YLens.png
Gui, Add, Pic, w48 h48 vBBatI, %A_ScriptDir%\src\Addon\Flashlight\BBat.png
Gui, Add, Pic, w48 h48 vBBulbI, %A_ScriptDir%\src\Addon\Flashlight\BBulb.png
Gui, Add, Pic, w48 h48 vBLensI, %A_ScriptDir%\src\Addon\Flashlight\BLens.png
Gui, Add, Pic, w48 h48 vYSpongeI, %A_ScriptDir%\src\Addon\Medkit\YSponge.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48 gonClick vPiSyB
Gui, Add, Button, w48 h48 gonClick vPAgentB
Gui, Add, Button, w48 h48 gonClick vGADressB
Gui, Add, Button, w48 h48 gonClick vGDressB
Gui, Add, Button, w48 h48 gonClick vGSutureB
Gui, Add, Button, w48 h48 gonClick vYRollB
Gui, Add, Button, x290 y361 w48 h48 gonPage vAddonsB2, 🢂
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38 vPiSyI, %A_ScriptDir%\src\Addon\Medkit\PiSy.png
Gui, Add, Pic, w48 h48 vPAgentI, %A_ScriptDir%\src\Addon\Medkit\PAgent.png
Gui, Add, Pic, w48 h48 vGADressI, %A_ScriptDir%\src\Addon\Medkit\GADress.png
Gui, Add, Pic, w48 h48 vGDressI, %A_ScriptDir%\src\Addon\Medkit\GDress.png
Gui, Add, Pic, w48 h48 vGSutureI, %A_ScriptDir%\src\Addon\Medkit\GSuture.png
Gui, Add, Pic, w48 h48 vYRollI, %A_ScriptDir%\src\Addon\Medkit\YRoll.png
;### ADDONS START --- PAGE 2
Gui, Add, Button, w48 h48 x22 y38 gonClick hidden vYScissorB
Gui, Add, Button, w48 h48 gonClick hidden vYThreadB
Gui, Add, Button, w48 h48 gonClick hidden vYWrapB
Gui, Add, Button, w48 h48 gonClick hidden vBBandB
Gui, Add, Button, w48 h48 gonClick hidden vBTapeB
Gui, Add, Button, w48 h48 gonClick hidden vBGloveB
;###COLUMN 2 IMAGES --- PAGE 2
Gui, Add, Pic, w48 h48 x75 y38 vYScissorI hidden, %A_ScriptDir%\src\Addon\Medkit\YScissor.png
Gui, Add, Pic, w48 h48 x75 y92 vYThreadI hidden, %A_ScriptDir%\src\Addon\Medkit\YThread.png
Gui, Add, Pic, w48 h48 x75 y145 vYWrapI hidden, %A_ScriptDir%\src\Addon\Medkit\YWrap.png
Gui, Add, Pic, w48 h48 x75 y200 vBBandI hidden, %A_ScriptDir%\src\Addon\Medkit\BBand.png
Gui, Add, Pic, w48 h48 vBTapeI hidden, %A_ScriptDir%\src\Addon\Medkit\BTape.png
Gui, Add, Pic, w48 h48 vBGloveI hidden, %A_ScriptDir%\src\Addon\Medkit\BGlove.png

Update_Buttons(Addons)
;### ADDONS END
Gui,Show,, AutoBloodweb
Return
Start:
Return

onClick() { ; handle clicking checkbox
    GuiControlGet, ch,, % A_GuiControl ; get state of button
    ch := Toggle_Char(ch) ; prepare to toggle state
    GuiControl ,, %A_GuiControl%, %ch% ; toggle state of button

    Selected := SubStr(A_GuiControl, 1, StrLen(A_GuiControl)-1)
    if (HasKey(Addons, Selected))
        Addons[Selected] := Toggle_Val(Addons[Selected])
    else if (HasKey(Items, Selected))
        Items[Selected] := Toggle_Val(Items[Selected])
}

onPage() { ; handle cycling pages
    if (TabName = "Addons") {
        GuiControlGet, ch,, % A_GuiControl
        AddonsPage += ch = Chr(0x1F880) ? -1 : 1 ; if left arrow is clicked, -1, otherwise +1
        if AddonsPage < 0
            AddonsPage := 2
        else if AddonsPage > 2
            AddonsPage := 0
        Update_Page("Addons", AddonsPage)
    }
    else {
        GuiControlGet, ch,, % A_GuiControl
        OfferingsPage += ch = Chr(0x1F880) ? -1 : 1 ; if left arrow is clicked, -1, otherwise +1
        if OfferingsPage < 0
            OfferingsPage := 3
        else if OfferingsPage > 3
            OfferingsPage := 0
        Update_Page("Offerings", OfferingsPage)
    }
}

Update_Buttons(Buttons) {
    for key, value in Buttons {
        ch := Set_Char(Buttons[key])
        key := key . "B"
        GuiControl ,, %key%, %ch%
    }
}

Update_Page(Page, PNum) { ; add all buttons that will be on pages
    Pages := {"BBat":0, "BBulb":0, "BLens":0, "GADress":0, "GBat":0, "GBulb":0, "GDress":0, "GSuture":0, "PAgent":0, "PiBulb":0, "PiSy":0, "PLens":0, "YBat":0, "YFila":0, "YGrip":0, "YGrip":0, "YLens":0, "YOptic":0, "YRoll":0, "YSponge":0, "YScissor":1, "YThread":1, "YWrap":1, "BBand":1, "BTape":1, "BGlove":1}
    for key, value in %Page% {
        Button := key . "B"
        Image := key . "I"
        if (Pages[key] = PNum) {
            GuiControl, Show, %Button%
            GuiControl, Show, %Image%
        }
        else {
            GuiControl, Hide, %Button%
            GuiControl, Hide, %Image%
        }
    }
}

Toggle_Val(x) {
    if (x = 0)
        return 1
    return 0
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

HasKey(haystack, needle) {
	for k, v in haystack {
      if (k = needle)
         return 1
   }
   return 0
}

Obj2Str(obj) {
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
Ini_Write(Category) { ; pass in the name of the dictionary
    for key, value in %Category%
        IniWrite, %value%, %A_ScriptDir%\src\lib\Settings.ini, %Category%, %key%
}

guiclose:
    Ini_Write("Items")
    Ini_Write("Addons")
    ExitApp
Return

TabChange:
    Gui, submit, nohide
    Global TabName
Return