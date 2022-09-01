onClick() { ; handle clicking checkbox
    GuiControlGet, ch,, % A_GuiControl ; get state of button
    ch := Toggle_Char(ch) ; prepare to toggle state
    GuiControl ,, %A_GuiControl%, %ch% ; toggle state of button

    Selected := SubStr(A_GuiControl, 1, StrLen(A_GuiControl)-1)
    if (HasKey(Addons, Selected))
        Addons[Selected] := Toggle_Val(Addons[Selected])
    else if (HasKey(Items, Selected))
        Items[Selected] := Toggle_Val(Items[Selected])
    else if (HasKey(Offerings, Selected))
        Offerings[Selected] := Toggle_Val(Offerings[Selected])
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
            OfferingsPage := 2
        else if OfferingsPage > 2
            OfferingsPage := 0
        Update_Page("Offerings", OfferingsPage)
    }
}

Update_Page(Page, PNum) { ; add all buttons that will be on pages
    Pages := {"GMask":1,"GPiper":1,"GCrest":1,"BClearReagent":2,"BFaintReagent":2,"YShroud":2,"YUnion":2,"YCoin":2,"YReagent":2,"BLaurel":2,"BAmaranth":2,"GSaltStat":1,"GChalk":1,"YCake":1,"BBat":0, "BBulb":0, "YLaurel":1, "YAmaranth":1, "YBlossom":1, "BBlossom":2, "BWilliam":2, "BTorn":2, "BVigo":2, "BAnno":2, "BBHooks":2, "BChalk":2, "YWilliam":1, "YPouch":1, "YChalk":1, "YEnvelope":1, "GRealtyKey":1, "GGlasses":1, "GRPD":1, "GMLetter":1, "GBone":1, "BLens":0, "GADress":0, "GBat":0, "GBulb":0, "GDress":0, "GSuture":0, "PAgent":0, "PiBulb":0, "PiSy":0, "PLens":0, "YBat":0, "YFila":0, "YGrip":0, "YGrip":0, "YLens":0, "YOptic":0, "YRoll":0, "YSponge":0, "YScissor":1, "YThread":1, "YWrap":1, "BBand":1, "BTape":1, "BGlove":1, "PiCog":1, "GWrench":1, "GHack":1, "YCutWire":1, "YClamp":1, "YPGlove":1, "YSocket":1, "YSpool":1, "BRag":1, "BInstruct":1, "BScrap":1, "YSpool":1, "BRag":1, "BScrap":1, "BInstruct":1, "PWRing":1, "PRing":1, "PAmber":2, "PGlass":2, "GToken":2, "YEToken":2, "YPearl":2, "YBeads":2, "BRope":2, "PBead":2, "GCord":2, "GStamp":2, "YJelly":2, "YBead":2, "YMWire":2,"YStamp":2,"YTwine":2,"BAddend":2, "PWWard":0, "GPartyStream":0, "GEnvel":0, "GWilliam":0, "GLaurel":0, "GAmaranth":0, "PBinding":0, "GBlossom":0, "GWeddingPhoto":0, "GAKey":0, "GCrowE":0, "PLips":0, "GDamagePhoto":0, "GLocket":0, "GCookbook":0, "PCoin":0, "PReagent":0, "GNoose":0, "POak":0, "GJigsaw":1}
    for key, value in %Page% {
        Button := key . "B"
        Image := key . "I"
        if (Pages[key] = PNum) {
            GuiControl, Show, %Button%
            ;Sleep, 1
            GuiControl, Show, %Image%
        }
        else {
            GuiControl, Hide, %Button%
            ;Sleep, 1
            GuiControl, Hide, %Image%
        }
    }
}

HasKey(haystack, needle) {
	for k, v in haystack {
      if (k = needle)
         return 1
   }
   return 0
}