#include C:\Users\marco\Documents\GitHub\Dbd-Auto-Perks\src\lib\Gdip.ahk
#MaxMem 9000
pToken := Gdip_Startup() ; start Gdip
clipboard := ""

node_values := {} ; node data (values)
nodes := {} ; node tree (locations)

search_locations_nodes := {1:"7,8,17,18"}
search_locations := {1:"630,448,640,391,700,420,722,447"}
root_ring := [677,425,783,486,783,610,677,671,573,610,573,486] ; root nodes

keynames := ["PFlash", "GFlash", "YFlash", "PMed", "GMed", "YMed", "BMed", "PABox", "PMBox", "PCBox", "YBox", "BBox", "PEBox", "PKey", "GKey", "PMap", "GMap", "PiKey", "BBat", "BBulb", "BLens", "GADress", "GBat", "GBulb", "GDress", "GSuture", "PAgent", "PiBulb", "PiSy", "PLens", "YBat", "YFila", "YGrip", "YLens", "YOptic", "YRoll", "YSponge", "YScissor", "YThread", "YWrap", "BBand", "BTape", "BGlove", "PiCog", "GWrench", "GHack", "YCutWire", "YClamp", "YPGlove", "YSocket", "YSpool", "BRag", "BScrap", "BInstruct", "PWRing", "PRing", "PAmber", "PGlass", "GToken", "YEToken", "YBeads", "YPearl", "BRope", "PBead", "GCord", "GStamp", "YJelly", "YBead", "YMWire", "YStamp", "YTwine", "BAddend", "BAmaranth", "BBlossom", "BCattleTag", "BCertifi", "BChalk", "BClearReagent", "BCordage", "BFaintReagent", "BLaurel", "BLeaflet", "BPage", "BPlate", "BRiverRock", "BTicket", "BWilliam", "GAKey", "GAmaranth", "GBlossom", "GBone", "GChalk", "GCookbook", "GCrest", "GDamagePhoto", "GEnvel", "GGlasses", "GJigsaw", "GLaurel", "GLocket", "GMask", "GNoose", "GPartyStream", "GPiper", "GRealtyKey", "GSaltStat", "GWeddingPhoto", "GWilliam", "PBinding", "PCoin", "PLips", "POak", "PReagent", "PWWard", "YAmaranth", "YBlossom", "YCake", "YCattleTag", "YChalk", "YChildBook", "YClapboard", "YCoin", "YEnvelope", "YLaurel", "YPage", "YPlate", "YPouch", "YReagent", "YReport", "YSeparation", "YShroud", "YSign", "YTicket", "YUnion", "YWilliam", "GCrowE", "MLetter", "GRPD", "GMLetter", "BBHooks", "BAnno", "BVigo", "BTorn","BLGrip","GWard"]


pBitmap := Gdip_BitmapFromScreen()
if A_ScreenHeight != 1080
    pBitmap := Gdip_ResizeBitmap(pBitmap, "w1920 h1080")

nsearch := [{x:657, y:440}, {x:763, y:500}, {x:763, y:624}, {x:658, y:685}, {x:553, y:624}, {x:553, y:500}, {x:720, y:328}, {x:836, y:390}, {x:899, y:501}, {x:899, y:623}, {x:836, y:734}, {x:720, y:796}, {x:596, y:796}, {x:480, y:734}, {x:417, y:623}, {x:417, y:501}, {x:480, y:390}, {x:596, y:328}, {x:658, y:209}, {x:838, y:257}, {x:969, y:388}, {x:1018, y:562}, {x:969, y:736}, {x:838, y:837}, {x:658, y:915}, {x:477, y:868}, {x:347, y:736}, {x:298, y:562}, {x:347, y:388}, {x:478, y:257}]


for _, obj in nsearch { ; for all of the search areas
DllCall("SetCursorPos", "Uint", obj.x, "Uint", obj.y) ; debugging
    str := "" ; temp string
    loop 35 { ; for x
        w := A_Index - 1 ; save x index
        loop 35 { ; for y
            ;DllCall("SetCursorPos", "Uint", obj.x, "Uint", obj.y) ; debugging
            DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", obj.x+w+5, "int", obj.y+A_Index+5, "uint*", ARGB) ; read pixel of x and y
            str .= col(ARGB) ; concatenate "1" if pixel RGB is over 100, otherwise 0
        }
    }
    ;clipboard := str ; debugging
    ;msgbox % clipboard ; debugging
DllCall("QueryPerformanceFrequency", "Int64*", freq)
DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
adwwd := compare(str, "") ; PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PABox,PMBox,PCBox,YBox,BBox,PEBox,PKey,GKey,PMap,GMap,PiKey,BBat,BBulb,BLens,GADress,GBat,GBulb,GDress,GSuture,PAgent,PiBulb,PiSy,PLens,YBat,YFila,YGrip,YLens,YOptic,YRoll,YSponge,YScissor,YThread,YWrap,BBand,BTape,BGlove,PiCog,GWrench,GHack,YCutWire,YClamp,YPGlove,YSocket,YSpool,BRag,BScrap,BInstruct,PWRing,PRing,PAmber,PGlass,GToken,YEToken,YBeads,YPearl,BRope,PBead,GCord,GStamp,YJelly,YBead,YMWire,YStamp,YTwine,BAddend,BAmaranth,BBlossom,BCattleTag,BCertifi,BChalk,BClearReagent,BCordage,BFaintReagent,BLaurel,BLeaflet,BPage,BPlate,BRiverRock,BTicket,BWilliam,GAKey,GAmaranth,GBlossom,GBone,GChalk,GCookbook,GCrest,GDamagePhoto,GEnvel,GGlasses,GJigsaw,GLaurel,GLocket,GMask,GNoose,GPartyStream,GPiper,GRealtyKey,GSaltStat,GWeddingPhoto,GWilliam,PBinding,PCoin,PLips,POak,PReagent,PWWard,YAmaranth,YBlossom,YCake,YCattleTag,YChalk,YChildBook,YClapboard,YCoin,YEnvelope,YLaurel,YPage,YPlate,YPouch,YReagent,YReport,YSeparation,YShroud,YSign,YTicket,YUnion,YWilliam,GCrowE,MLetter,GRPD,GMLetter,BBHooks,BAnno,BVigo,BTorn,BGrip,GWard
DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
MsgBox % "Elapsed QPC time is " . (CounterAfter - CounterBefore) / freq * 1000 " ms " adwwd 
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

            compare := Similarity(str, data[2]) ; if we need it, compare it

            if (compare > min) { ; if it is the best match so far, set as best
                min := compare
                best := data[1]
            }
            if (min = 100) ; if we found a match already, return
                return best
    }
    return best
}


Gdip_DisposeImage(pBitmap) ;Make sure to free the bitmap when you finish with it
Gdip_Shutdown(pToken)
ExitApp


col(ARGB) {
    B := ARGB & 255 ; 0-255 convert ARGB to RGB
    G := (ARGB >> 8) & 255 ; 0-255 convert ARGB to RGB
    R := (ARGB >> 16) & 255 ; 0-255 convert ARGB to RGB
    ;grayscale := 0.299*R + 0.587*G + 0.114*B ; 0-255 convert RGB to grayscale
    ;if grayscale > 176
        ;return "1"
    ;if grayscale > 100
        ;return "1"
    if R > 100
        if G > 100
            if B > 100
                return "1"
    return "0"
}

Similarity(a,b){
	StringSplit, a,a
	StringSplit, b,b
	LoopCount := (a0 > b0) ? a0 : b0
	Loop, % LoopCount
	{
		if (a%A_Index% = b%A_index%)
			matches++
	}
	return (matches = "") ? 0 : Round(matches/LoopCount*100)
}

esc::
Gdip_DisposeImage(pBitmap) ;Make sure to free the bitmap when you finish with it
Gdip_Shutdown(pToken)
exitapp