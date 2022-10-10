#include C:\Users\marco\Documents\GitHub\Dbd-Auto-Perks\src\lib\Gdip.ahk
#InstallKeybdHook
#MaxMem 9000
pToken := Gdip_Startup() ; start Gdip


search_locations_nodes := {1:"7,8,17,18"}
search_locations := {1:"630,448,640,391,700,420,722,447"}

;keynames := ["PFlash", "GFlash", "YFlash", "PMed", "GMed", "YMed", "BMed", "PABox", "PMBox", "PCBox", "YBox", "BBox", "PEBox", "PKey", "GKey", "PMap", "GMap", "PiKey", "BBat", "BBulb", "BLens", "GADress", "GBat", "GBulb", "GDress", "GSuture", "PAgent", "PiBulb", "PiSy", "PLens", "YBat", "YFila", "YGrip", "YLens", "YOptic", "YRoll", "YSponge", "YScissor", "YThread", "YWrap", "BBand", "BTape", "BGlove", "PiCog", "GWrench", "GHack", "YCutWire", "YClamp", "YPGlove", "YSocket", "YSpool", "BRag", "BScrap", "BInstruct", "PWRing", "PRing", "PAmber", "PGlass", "GToken", "YEToken", "YBeads", "YPearl", "BRope", "PBead", "GCord", "GStamp", "YJelly", "YBead", "YMWire", "YStamp", "YTwine", "BAddend", "BAmaranth", "BBlossom", "BCattleTag", "BCertifi", "BChalk", "BClearReagent", "BCordage", "BFaintReagent", "BLaurel", "BLeaflet", "BPage", "BPlate", "BRiverRock", "BTicket", "BWilliam", "GAKey", "GAmaranth", "GBlossom", "GBone", "GChalk", "GCookbook", "GCrest", "GDamagePhoto", "GEnvel", "GGlasses", "GJigsaw", "GLaurel", "GLocket", "GMask", "GNoose", "GPartyStream", "GPiper", "GRealtyKey", "GSaltStat", "GWeddingPhoto", "GWilliam", "PBinding", "PCoin", "PLips", "POak", "PReagent", "PWWard", "YAmaranth", "YBlossom", "YCake", "YCattleTag", "YChalk", "YChildBook", "YClapboard", "YCoin", "YEnvelope", "YLaurel", "YPage", "YPlate", "YPouch", "YReagent", "YReport", "YSeparation", "YShroud", "YSign", "YTicket", "YUnion", "YWilliam", "GCrowE", "MLetter", "GRPD", "GMLetter", "BBHooks", "BAnno", "BVigo", "BTorn","BLGrip","GWard"]





Gdip_DisposeImage(pBitmap) ;Make sure to free the bitmap when you finish with it
Gdip_Shutdown(pToken)
ExitApp

find(allow) {
    nsearch := [{x:657, y:440}, {x:763, y:500}, {x:763, y:624}, {x:658, y:685}, {x:553, y:624}, {x:553, y:500}, {x:720, y:328}, {x:836, y:390}, {x:899, y:501}, {x:899, y:623}, {x:836, y:734}, {x:720, y:796}, {x:596, y:796}, {x:480, y:734}, {x:417, y:623}, {x:417, y:501}, {x:480, y:390}, {x:596, y:328}, {x:658, y:209}, {x:838, y:257}, {x:969, y:388}, {x:1018, y:562}, {x:969, y:736}, {x:838, y:868}, {x:658, y:915}, {x:477, y:868}, {x:347, y:736}, {x:298, y:562}, {x:347, y:388}, {x:478, y:257}]

    while (A_TimeIdleKeyboard > 1) {
        nodevalues := {} ; node data (values)
        nodes := {} ; node tree (path)
        skip := ""
        pBitmap := Gdip_BitmapFromScreen()
        if A_ScreenHeight != 1080
            pBitmap := Gdip_ResizeBitmap(pBitmap, "w1920 h1080")

        ; for all the path coordinates, check and build the path

        for _, obj in nsearch { ; for all of the search areas
            if InStr(A_Index, skip)
                Continue
            DllCall("SetCursorPos", "Uint", obj.x, "Uint", obj.y) ; debugging
                str := "" ; temp string
                loop 35 { ; for x
                    w := A_Index - 1 ; save x index
                    loop 35 { ; for y
                        DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", obj.x+w+5, "int", obj.y+A_Index+5, "uint*", ARGB) ; read pixel of x and y
                        str .= col(ARGB) ; concatenate "1" if pixel RGB is over 100, otherwise 0
                    }
                }
            if ((val := compare(str, allow))) ; "PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PABox,PMBox,PCBox,YBox,BBox,PEBox,PKey,GKey,PMap,GMap,PiKey,BBat,BBulb,BLens,GADress,GBat,GBulb,GDress,GSuture,PAgent,PiBulb,PiSy,PLens,YBat,YFila,YGrip,YLens,YOptic,YRoll,YSponge,YScissor,YThread,YWrap,BBand,BTape,BGlove,PiCog,GWrench,GHack,YCutWire,YClamp,YPGlove,YSocket,YSpool,BRag,BScrap,BInstruct,PWRing,PRing,PAmber,PGlass,GToken,YEToken,YBeads,YPearl,BRope,PBead,GCord,GStamp,YJelly,YBead,YMWire,YStamp,YTwine,BAddend,BAmaranth,BBlossom,BCattleTag,BCertifi,BChalk,BClearReagent,BCordage,BFaintReagent,BLaurel,BLeaflet,BPage,BPlate,BRiverRock,BTicket,BWilliam,GAKey,GAmaranth,GBlossom,GBone,GChalk,GCookbook,GCrest,GDamagePhoto,GEnvel,GGlasses,GJigsaw,GLaurel,GLocket,GMask,GNoose,GPartyStream,GPiper,GRealtyKey,GSaltStat,GWeddingPhoto,GWilliam,PBinding,PCoin,PLips,POak,PReagent,PWWard,YAmaranth,YBlossom,YCake,YCattleTag,YChalk,YChildBook,YClapboard,YCoin,YEnvelope,YLaurel,YPage,YPlate,YPouch,YReagent,YReport,YSeparation,YShroud,YSign,YTicket,YUnion,YWilliam,GCrowE,MLetter,GRPD,GMLetter,BBHooks,BAnno,BVigo,BTorn,BGrip,GWard"
                nodevalues.Insert(A_Index,val)
                ; ^^^ replace with, navigate to, instead of adding it to a dic

            ;clipboard := str
            ;msgbox % clipboard
        }
    }
}


col(ARGB) {
    B := ARGB & 255 ; 0-255 convert ARGB to RGB
    G := (ARGB >> 8) & 255 ; 0-255 convert ARGB to RGB
    R := (ARGB >> 16) & 255 ; 0-255 convert ARGB to RGB
    if R > 100
        if G > 100
            if B > 100
                return "1"
    return "0"
}

similarity(a,b){
	StringSplit, a,a
	StringSplit, b,b
	LoopCount := (a0 > b0) ? a0 : b0
	Loop, % LoopCount
	{
		if (a%A_Index% = b%A_index%)
			matches++
	}
	return (!matches) ? 0 : Round(matches/LoopCount*100)
}

compare(str,nodes) {
    if (str = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
        return ; if the node is empty, return
    min := 90 ; min similarity
    best := null ; best match
    Loop, read, %A_ScriptDir%\src\lib\data.txt ; read the data set
    {
        data := StrSplit(A_LoopReadLine, ",") ; split into [nodename, data]

        if !InStr(nodes, data[1]) ; if we don't need it, skip it
            Continue
        if (min = 100) ; if we found a match already, return
            return best

        if ((compare := similarity(str, data[2])) > min) { ; if it is the best match so far, set as best
            min := compare
            best := data[1]
        }
    }
    return best
}

Obj2Str(obj) {
	For k,v in obj
		Str .= k " = " v "`n"
	return RTrim(Str, "`n")
}

esc::
Gdip_DisposeImage(pBitmap) ;Make sure to free the bitmap when you finish with it
Gdip_Shutdown(pToken)
exitapp