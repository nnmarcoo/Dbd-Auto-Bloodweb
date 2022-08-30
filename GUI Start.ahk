﻿;###TODO
;finish addons tab
;finish offerings tab
;finish search algo
;add perks? checkbox
;add event items checkbox
;add pages for addons and offerings tab using buttons

Global Items := Initialize("Items")
Global Addons := Initialize("Addons")
Global Offerings := Initialize("Offerings")
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
Gui, Add, Button, w48 h48 x22 y36 gonClick vPiBulbB
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
Gui, Add, Button, w48 h48 x22 y36 gonClick hidden vYScissorB
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
;###COLUMN 3 BUTTONS --- PAGE 2
Gui, Add, Button, x130 y38 w48 h48 gonClick hidden vPiCogB
Gui, Add, Button, w48 h48 gonClick hidden vGWrenchB
Gui, Add, Button, w48 h48 gonClick hidden vGHackB
Gui, Add, Button, w48 h48 gonClick hidden vYCutWireB
Gui, Add, Button, w48 h48 gonClick hidden vYClampB
Gui, Add, Button, w48 h48 gonClick hidden vYPGloveB
Gui, Add, Button, w48 h48 gonClick hidden vYSocketB ;extra button
;###COLUMN 4 IMAGES --- PAGE 2
Gui, Add, Pic, w48 h48 x183 y38 vPiCogI hidden, %A_ScriptDir%\src\Addon\Toolbox\PiCog.png
Gui, Add, Pic, w48 h48 vGWrenchI hidden, %A_ScriptDir%\src\Addon\Toolbox\GWrench.png
Gui, Add, Pic, w48 h48 vGHackI hidden, %A_ScriptDir%\src\Addon\Toolbox\GHack.png
Gui, Add, Pic, w48 h48 vYCutWireI hidden, %A_ScriptDir%\src\Addon\Toolbox\YCutWire.png
Gui, Add, Pic, w48 h48 vYClampI hidden, %A_ScriptDir%\src\Addon\Toolbox\YClamp.png
Gui, Add, Pic, w48 h48 vYPGloveI hidden, %A_ScriptDir%\src\Addon\Toolbox\YPGlove.png
Gui, Add, Pic, w48 h48 vYSocketI hidden, %A_ScriptDir%\src\Addon\Toolbox\YSocket.png
;###COLUMN 5 BUTTONS --- PAGE 2
Gui, Add, Button, x237 y38 w48 h48 gonClick hidden vYSpoolB
Gui, Add, Button, w48 h48 gonClick hidden vBRagB
Gui, Add, Button, w48 h48 gonClick hidden vBScrapB
Gui, Add, Button, w48 h48 gonClick hidden vBInstructB
Gui, Add, Button, w48 h48 gonClick hidden vPWRingB
Gui, Add, Button, w48 h48 gonClick hidden vPRingB
;###COLUMN 6 IMAGES --- PAGE 2
Gui, Add, Pic, w48 h48 x290 y38 vYSpoolI hidden, %A_ScriptDir%\src\Addon\Toolbox\YSpool.png
Gui, Add, Pic, w48 h48 vBRagI hidden, %A_ScriptDir%\src\Addon\Toolbox\BRag.png
Gui, Add, Pic, w48 h48 vBScrapI hidden, %A_ScriptDir%\src\Addon\Toolbox\BScrap.png
Gui, Add, Pic, w48 h48 vBInstructI hidden, %A_ScriptDir%\src\Addon\Toolbox\BInstruct.png
Gui, Add, Pic, w48 h48 vPWRingI hidden, %A_ScriptDir%\src\Addon\Key\PWRing.png
Gui, Add, Pic, w48 h48 vPRingI hidden, %A_ScriptDir%\src\Addon\Key\PRing.png
;###COLUMN 1 BUTTONS --- PAGE 3
Gui, Add, Button, w48 h48 x22 y36 gonClick hidden vPAmberB
Gui, Add, Button, w48 h48 gonClick hidden vPGlassB
Gui, Add, Button, w48 h48 gonClick hidden vGTokenB
Gui, Add, Button, w48 h48 gonClick hidden vYETokenB
Gui, Add, Button, w48 h48 gonClick hidden vYBeadsB
Gui, Add, Button, w48 h48 gonClick hidden vYPearlB
;###COLUMN 2 IMAGES --- PAGE 3
Gui, Add, Pic, w48 h48 x75 y38 vPAmberI hidden, %A_ScriptDir%\src\Addon\Key\PAmber.png
Gui, Add, Pic, w48 h48 x75 y92 vPGlassI hidden, %A_ScriptDir%\src\Addon\Key\PGlass.png
Gui, Add, Pic, w48 h48 x75 y145 vGTokenI hidden, %A_ScriptDir%\src\Addon\Key\GToken.png
Gui, Add, Pic, w48 h48 x75 y200 vYETokenI hidden, %A_ScriptDir%\src\Addon\Key\YEToken.png
Gui, Add, Pic, w48 h48 vYBeadsI hidden, %A_ScriptDir%\src\Addon\Key\YBeads.png
Gui, Add, Pic, w48 h48 vYPearlI hidden, %A_ScriptDir%\src\Addon\Key\YPearl.png
;###COLUMN 3 BUTTONS --- PAGE 3
Gui, Add, Button, x130 y38 w48 h48 gonClick hidden vBRopeB
Gui, Add, Button, w48 h48 gonClick hidden vPBeadB
Gui, Add, Button, w48 h48 gonClick hidden vGCordB
Gui, Add, Button, w48 h48 gonClick hidden vGStampB
Gui, Add, Button, w48 h48 gonClick hidden vYJellyB
Gui, Add, Button, w48 h48 gonClick hidden vYBeadB
Gui, Add, Button, w48 h48 gonClick hidden vYMWireB ;extra button
;###COLUMN 4 IMAGES --- PAGE 3
Gui, Add, Pic, w48 h48 x183 y38 vBRopeI hidden, %A_ScriptDir%\src\Addon\Key\BRope.png
Gui, Add, Pic, w48 h48 vPBeadI hidden, %A_ScriptDir%\src\Addon\Map\PBead.png
Gui, Add, Pic, w48 h48 vGCordI hidden, %A_ScriptDir%\src\Addon\Map\GCord.png
Gui, Add, Pic, w48 h48 vGStampI hidden, %A_ScriptDir%\src\Addon\Map\GStamp.png
Gui, Add, Pic, w48 h48 vYJellyI hidden, %A_ScriptDir%\src\Addon\Map\YJelly.png
Gui, Add, Pic, w48 h48 vYBeadI hidden, %A_ScriptDir%\src\Addon\Map\YBead.png
Gui, Add, Pic, w48 h48 vYMWireI hidden, %A_ScriptDir%\src\Addon\Map\YMWire.png
;###COLUMN 5 BUTTONS --- PAGE 3
Gui, Add, Button, x237 y38 w48 h48 gonClick hidden vYStampB
Gui, Add, Button, w48 h48 gonClick hidden vYTwineB
Gui, Add, Button, w48 h48 gonClick hidden vBAddendB
;###COLUMN 6 IMAGES --- PAGE 3
Gui, Add, Pic, w48 h48 x290 y38 vYStampI hidden, %A_ScriptDir%\src\Addon\Map\YStamp.png
Gui, Add, Pic, w48 h48 vYTwineI hidden, %A_ScriptDir%\src\Addon\Map\YTwine.png
Gui, Add, Pic, w48 h48 vBAddendI hidden, %A_ScriptDir%\src\Addon\Map\BAddend.png
Update_Buttons(Addons)
;### ADDONS END
Gui,Tab,Offerings
;###OFFERINGS START
Gui, Add, Button, w48 h48 x22 y36 gonClick vPBindingB
Gui, Add, Button, w48 h48 gonClick vPCoinB
Gui, Add, Button, w48 h48 gonClick vPLipsB
Gui, Add, Button, w48 h48 gonClick vPOakB
Gui, Add, Button, w48 h48 gonClick vPReagentB
Gui, Add, Button, w48 h48 gonClick vPWWardB
Gui, Add, Button, w48 h48 gonPage vOfferingsB, 🢀
;###COLUMN 2 IMAGES
Gui, Add, Pic, w48 h48 x75 y38 vPBindingI, %A_ScriptDir%\src\Offering\PBinding.png
Gui, Add, Pic, w48 h48 x75 y92 vPCoinI, %A_ScriptDir%\src\Offering\PCoin.png
Gui, Add, Pic, w48 h48 x75 y145 vPLipsI, %A_ScriptDir%\src\Offering\PLips.png
Gui, Add, Pic, w48 h48 x75 y200 vPOakI, %A_ScriptDir%\src\Offering\POak.png
Gui, Add, Pic, w48 h48 vPReagentI, %A_ScriptDir%\src\Offering\PReagent.png
Gui, Add, Pic, w48 h48 vPWWardI, %A_ScriptDir%\src\Offering\PWWard.png
;###COLUMN 3 BUTTONS
Gui, Add, Button, x130 y38 w48 h48 gonClick vGPartyStreamB
Gui, Add, Button, w48 h48 gonClick vGEnvelB
Gui, Add, Button, w48 h48 gonClick vGLaurelB
Gui, Add, Button, w48 h48 gonClick vGAmaranthB
Gui, Add, Button, w48 h48 gonClick vGBlossomB
Gui, Add, Button, w48 h48 gonClick vGWilliamB
Gui, Add, Button, w48 h48 gonClick vGAKeyB ;extra button
;###COLUMN 4 IMAGES
Gui, Add, Pic, w48 h48 x183 y38 vGPartyStreamI, %A_ScriptDir%\src\Offering\GPartyStream.png
Gui, Add, Pic, w48 h48 vGEnvelI, %A_ScriptDir%\src\Offering\GEnvel.png
Gui, Add, Pic, w48 h48 vGLaurelI, %A_ScriptDir%\src\Offering\GLaurel.png
Gui, Add, Pic, w48 h48 vGAmaranthI, %A_ScriptDir%\src\Offering\GAmaranth.png
Gui, Add, Pic, w48 h48 vGBlossomI, %A_ScriptDir%\src\Offering\GBlossom.png
Gui, Add, Pic, w48 h48 vGWilliamI, %A_ScriptDir%\src\Offering\GWilliam.png
Gui, Add, Pic, w48 h48 vGAKeyI, %A_ScriptDir%\src\Offering\GAKey.png
;###COLUMN 5 BUTTONS
Gui, Add, Button, x237 y38 w48 h48 gonClick vGWeddingPhotoB
Gui, Add, Button, w48 h48 gonClick vGCrowEB
Gui, Add, Button, w48 h48 gonClick vGDamagePhotoB
Gui, Add, Button, w48 h48 gonClick vGNooseB
Gui, Add, Button, w48 h48 gonClick vGCookbookB
Gui, Add, Button, w48 h48 gonClick vGLocketB
Gui, Add, Button, x290 y361 w48 h48 gonPage vOfferingsB2, 🢂
;###COLUMN 6 IMAGES
Gui, Add, Pic, w48 h48 x290 y38 vGWeddingPhotoI, %A_ScriptDir%\src\Offering\GWeddingPhoto.png
Gui, Add, Pic, w48 h48 vGCrowEI, %A_ScriptDir%\src\Offering\GCrowE.png
Gui, Add, Pic, w48 h48 vGDamagePhotoI, %A_ScriptDir%\src\Offering\GDamagePhoto.png
Gui, Add, Pic, w48 h48 vGNooseI, %A_ScriptDir%\src\Offering\GNoose.png
Gui, Add, Pic, w48 h48 vGCookbookI, %A_ScriptDir%\src\Offering\GCookbook.png
Gui, Add, Pic, w48 h48 vGLocketI, %A_ScriptDir%\src\Offering\GLocket.png
;### ADDONS START --- PAGE 2
Gui, Add, Button, w48 h48 x22 y36 gonClick hidden vGJigsawB
Gui, Add, Button, w48 h48 gonClick hidden vGBoneB
Gui, Add, Button, w48 h48 gonClick hidden vGMLetterB
Gui, Add, Button, w48 h48 gonClick hidden vGRPDB
Gui, Add, Button, w48 h48 gonClick hidden vGGlassesB
Gui, Add, Button, w48 h48 gonClick hidden vGRealtyKeyB
;###COLUMN 2 IMAGES --- PAGE 2
Gui, Add, Pic, w48 h48 x75 y38 vGJigsawI hidden, %A_ScriptDir%\src\Offering\GJigsaw.png
Gui, Add, Pic, w48 h48 x75 y92 vGBoneI hidden, %A_ScriptDir%\src\Offering\GBone.png
Gui, Add, Pic, w48 h48 x75 y145 vGMLetterI hidden, %A_ScriptDir%\src\Offering\GMLetter.png
Gui, Add, Pic, w48 h48 x75 y200 vGRPDI hidden, %A_ScriptDir%\src\Offering\GRPD.png
Gui, Add, Pic, w48 h48 vGGlassesI hidden, %A_ScriptDir%\src\Offering\GGlasses.png
Gui, Add, Pic, w48 h48 vGRealtyKeyI hidden, %A_ScriptDir%\src\Offering\GRealtyKey.png
Gui,Show,, Auto Bloodweb
Update_Buttons(Offerings)
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
    Pages := {"BBat":0, "BBulb":0, "BLens":0, "GADress":0, "GBat":0, "GBulb":0, "GDress":0, "GSuture":0, "PAgent":0, "PiBulb":0, "PiSy":0, "PLens":0, "YBat":0, "YFila":0, "YGrip":0, "YGrip":0, "YLens":0, "YOptic":0, "YRoll":0, "YSponge":0, "YScissor":1, "YThread":1, "YWrap":1, "BBand":1, "BTape":1, "BGlove":1, "PiCog":1, "GWrench":1, "GHack":1, "YCutWire":1, "YClamp":1, "YPGlove":1, "YSocket":1, "YSpool":1, "BRag":1, "BInstruct":1, "BScrap":1, "YSpool":1, "BRag":1, "BScrap":1, "BInstruct":1, "PWRing":1, "PRing":1, "PAmber":2, "PGlass":2, "GToken":2, "YEToken":2, "YPearl":2, "YBeads":2, "BRope":2, "PBead":2, "GCord":2, "GStamp":2, "YJelly":2, "YBead":2, "YMWire":2,"YStamp":2,"YTwine":2,"BAddend":2, "PWWard":0, "GPartyStream":0, "GEnvel":0, "GWilliam":0, "GLaurel":0, "GAmaranth":0, "PBinding":0, "GBlossom":0, "GWeddingPhoto":0, "GAKey":0, "GCrowE":0, "PLips":0, "GDamagePhoto":0, "GLocket":0, "GCookbook":0, "PCoin":0, "PReagent":0, "GNoose":0, "POak":0, "GJigsaw":1}
    for key, value in %Page% {
        Button := key . "B"
        Image := key . "I"
        if (Pages[key] = PNum) {
            GuiControl, Show, %Button%
            Sleep, 1
            GuiControl, Show, %Image%
        }
        else {
            GuiControl, Hide, %Button%
            Sleep, 1
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