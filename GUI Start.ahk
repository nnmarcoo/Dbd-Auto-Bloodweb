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
Gui, Add,Tab3,x10 y10 w340 h405 ,Items|Addons|Offerings ;create a tab control Flashlight|Medkit|Toolbox|Key|Map
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
;### ADDONS START
Gui, Add, Button, w48 h48 gonClick vPiBulbB
Gui, Add, Button, w48 h48 gonClick vPLensB
Gui, Add, Button, w48 h48 gonClick vGBatB
Gui, Add, Button, w48 h48 gonClick vGBulbB
Gui, Add, Button, w48 h48 gonClick vYFilaB
Gui, Add, Button, w48 h48 gonClick vYBatB
Gui, Add, Button, w48 h48 gonPage vAddonsB, 🢀
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_oddBulb.png
Gui, Add, Pic, w48 h48 x75 y92, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_high-EndSapphireLens.png
Gui, Add, Pic, w48 h48 x75 y145, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_longLifeBattery.png
Gui, Add, Pic, w48 h48 x75 y200, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_intenseHalogen.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_lowAmpFilament.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_heavyDutyBattery.png
Gui, Add, Pic, w48 h48,
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48 gonClick vYGripB
Gui, Add, Button, w48 h48 gonClick vYOpticB
Gui, Add, Button, w48 h48 gonClick vYLensB
Gui, Add, Button, w48 h48 gonClick vBBatB
Gui, Add, Button, w48 h48 gonClick vBBulbB
Gui, Add, Button, w48 h48 gonClick vBLensB
Gui, Add, Button, w48 h48 gonClick vYSpongeB ;extra button
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_rubberGrip.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_tirOptic.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_focusLens.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_battery.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_powerBulb.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Flashlight\FulliconAddon_wideLens.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_sponge.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48 gonClick vPiSyB
Gui, Add, Button, w48 h48 gonClick vPAgentB
Gui, Add, Button, w48 h48 gonClick vGADressB
Gui, Add, Button, w48 h48 gonClick vGDressB
Gui, Add, Button, w48 h48 gonClick vGSutureB
Gui, Add, Button, w48 h48 gonClick vYRollB
Gui, Add, Button, x290 y361 w48 h48 gonPage vAddonsB2, 🢂
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_anti-haemorrhagicSyringe.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_stypticAgent.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_abdominalDressing.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_gelDressings.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_surgicalSuture.png
Gui, Add, Pic, w48 h48, %A_ScriptDir%\src\Addon\Medkit\FulliconAddon_gauzeRoll.png
Update_Buttons(Addons)
;### ITEMS END
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
    if (A_GuiControl = "AddonsB" or A_GuiControl = "AddonsB2") {
        GuiControlGet, ch,, % A_GuiControl
        AddonsPage += ch = Chr(0x1F880) ? -1 : 1 ; if left arrow is clicked, -1, otherwise +1
        if AddonsPage < 0
            AddonsPage := 2
        else if AddonsPage > 2
            AddonsPage := 0
    }
    else {
        GuiControlGet, ch,, % A_GuiControl
        OfferingsPage += ch = Chr(0x1F880) ? -1 : 1 ; if left arrow is clicked, -1, otherwise +1
        if OfferingsPage < 0
            OfferingsPage := 3
        else if OfferingsPage > 3
            OfferingsPage := 0
    }
    Update_Page(SubStr(A_GuiControl, 1, StrLen(A_GuiControl)-1))
}

guiclose:
    Ini_Write("Items")
    Ini_Write("Addons")
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

Update_Page(Page) {
    for key, value in %Page% {
        key := key . "B"
        GuiControl, Hide, %key%
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

HasKey(haystack, needle) {
	for k, v in haystack {
      if (k = needle)
         return 1
   }
   return 0
}