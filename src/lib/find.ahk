;todo
; replace nsearch with array of arrays instead of array of objects
;if special clicked n nodes, stop the list?
;or if length exceeds something, cut off

; add hashing to string comparison (CRC32)

#InstallMouseHook
pToken := Gdip_Startup()

find(allow) {
    nsearch := [{x:657,y:440},{x:763,y:500},{x:763,y:624},{x:658,y:685},{x:553,y:624},{x:553,y:500},{x:720,y:328},{x:836,y:390},{x:899,y:501},{x:899,y:623},{x:836,y:734},{x:720,y:796},{x:596,y:796},{x:480,y:734},{x:417,y:623},{x:417,y:501},{x:480,y:390},{x:596,y:328},{x:658,y:209},{x:838,y:257},{x:969,y:388},{x:1018,y:562},{x:969,y:736},{x:838,y:868},{x:658,y:915},{x:477,y:868},{x:347,y:736},{x:298,y:562},{x:347,y:388},{x:478,y:257}] ; coordinates that will be searched for the icons
    ncords := [[[605,440],[640,391],[699,420],[723,447]],[[770,472],[809,480],[838,521],[821,554]],[[823,608],[830,643],[809,682],[773,689]],[[725,717],[701,746],[656,746],[629,720]],[[588,699],[547,686],[517,644],[536,612]],[[536,554],[526,521],[545,479],[604,396]],[[718,304],[783,322]],[[856,361],[902,409]],[[944,481],[964,544]],[[964,620],[945,584]],[[907,755],[858,807]],[[785,843],[716,864]],[[640,861],[569,845]],[[500,808],[449,756]],[[409,689],[390,620]],[[398,542],[408,475]],[[448,410],[499,355]],[[569,320],[642,299]]] ; coordinates of the paths that each node leads to
    nkey := [[17,18,7,8],[7,8,9,10],[9,10,11,12],[11,12,13,14],[13,14,15,16],[15,16,17,18],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,19]] ; a key representing which nodes are led to by a node(the index)
    npkey := [[],[],[],[],[],[],[1,2],[1,2],[2,3],[2,3],[3,4],[3,4],[4,5],[4,5],[5,6],[5,6],[1,6],[1,6],[7,18],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18]] ; a key representing which nodes lead to the node(the index)
    ckey := ""

    /*
    multiplier := 1
    if A_ScreenHeight > 1080
        multiplier := A_ScreenHeight / 1080
    else if A_ScreenHeight < 1080
        multiplier := 1080 / A_ScreenHeight
    */
    mh := A_ScreenHeight != 1080 ? A_ScreenHeight / 1080 : 1
    mw := A_ScreenWidth != 1920 ? A_ScreenWidth / 1920 : 1
    Sleep, 300
    while (A_TimeIdleMouse > 100) {
        if WinExist("DeadByDaylight")
            WinActivate
        else
            return
        Sleep, 4000

        nqueue := [] ; queue of nodes to be clicked
        nodepaths := ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""] ; node tree (path)
        DllCall("SetCursorPos", "Uint", 0, "Uint", 0) ; get mouse out of the way for screenshot
        pBitmap := Gdip_BitmapFromScreen(1)
        if A_ScreenHeight != 1080
            pBitmap := Gdip_ResizeBitmap(pBitmap, "h1080")
        ;Gdip_SaveBitmapToFile(pBitmap, "lores.png", 100)

        for _, arr in ncords { ; for all the path coordinates, check and build the path
            Incords := A_Index
            for _, cord in arr {
                DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", cord[1], "int", cord[2], "uint*", npath) ; read pixel of x and y
                p := lum(npath)
                nodepaths[Incords] .= p = "g" || p = "t" ? nkey[Incords][A_Index] "," : "" ; some key 1:7,8,17,18
            } 
        }

        for _, obj in nsearch { ; for all of the search areas
            ;DllCall("SetCursorPos", "Uint", obj.x, "Uint", obj.y) ; debugging
                str := "" ; temp string
                loop 35 { ; for x
                    w := A_Index - 1 ; save x index
                    loop 35 { ; for y
                        DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", obj.x+w+5, "int", obj.y+A_Index+5, "uint*", ARGB) ; read pixel of x and y
                        str .= col(ARGB) ; concatenate "1" if pixel RGB is over 100, otherwise 0
                    }
                }
            if compare(str, allow) { ; "PFlash,GFlash,YFlash,PMed,GMed,YMed,BMed,PABox,PMBox,PCBox,YBox,BBox,PEBox,PKey,GKey,PMap,GMap,PiKey,BBat,BBulb,BLens,GADress,GBat,GBulb,GDress,GSuture,PAgent,PiBulb,PiSy,PLens,YBat,YFila,YGrip,YLens,YOptic,YRoll,YSponge,YScissor,YThread,YWrap,BBand,BTape,BGlove,PiCog,GWrench,GHack,YCutWire,YClamp,YPGlove,YSocket,YSpool,BRag,BScrap,BInstruct,PWRing,PRing,PAmber,PGlass,GToken,YEToken,YBeads,YPearl,BRope,PBead,GCord,GStamp,YJelly,YBead,YMWire,YStamp,YTwine,BAddend,BAmaranth,BBlossom,BCattleTag,BCertifi,BChalk,BClearReagent,BCordage,BFaintReagent,BLaurel,BLeaflet,BPage,BPlate,BRiverRock,BTicket,BWilliam,GAKey,GAmaranth,GBlossom,GBone,GChalk,GCookbook,GCrest,GDamagePhoto,GEnvel,GGlasses,GJigsaw,GLaurel,GLocket,GMask,GNoose,GPartyStream,GPiper,GRealtyKey,GSaltStat,GWeddingPhoto,GWilliam,PBinding,PCoin,PLips,POak,PReagent,PWWard,YAmaranth,YBlossom,YCake,YCattleTag,YChalk,YChildBook,YClapboard,YCoin,YEnvelope,YLaurel,YPage,YPlate,YPouch,YReagent,YReport,YSeparation,YShroud,YSign,YTicket,YUnion,YWilliam,GCrowE,MLetter,GRPD,GMLetter,BBHooks,BAnno,BVigo,BTorn,BGrip,GWard"
                ;tooltip % Arr2Str2(nqueue)
                goal := A_Index
                nqueue.InsertAt(0, goal)
                ;build node queue vvv
                while (goal > 6) {
                    for i, v in npkey[goal] { ; for each of the possible paths the node can lead to
                        if InStr(nodepaths[v], goal) { ; if the possible path contains the actual path
                            goal := v ; set that as the new goal
                            nqueue.InsertAt(0, goal) ; add that goal to the beginning of the queue
                            break ; exit (don't check the other possible paths)
                        }
                    }
                    if A_Index > 2
                        break
                }
            }
        }
        for _, node in RemoveDup(nqueue) { ; remove duplicates
            ;tooltip % Arr2Str2(RemoveDup(nqueue)) "`n(" nsearch[node].x+15 ", " nsearch[node].y+15 ")`n(" (nsearch[node].x+15)*mw ", " (nsearch[node].y+15)*mh ")"
            if A_TimeIdleMouse < 200  ; bad solution
                break
            click((nsearch[node].x+15)*mw, (nsearch[node].y+15)*mh)
        }

        loop {
            if A_TimeIdleMouse < 200 ; bad solution
                break
            try {
                cords := px(0xFF9c9473)
                ;tooltip % "random nodes`n(" cords.x+15 ", " cords.y+15 ")`n(" (cords.x+15)*mw ", " (cords.y+15)*mh ")"
                click(cords.x+(15*mw),cords.y+(15*mh))
            } catch e {
                break
            }
        }
    }
    DllCall("SetCursorPos", "Uint", A_ScreenWidth/2, "Uint", A_ScreenHeight/2)
    Gdip_DisposeImage(pBitmap)
    ;tooltip
}

click(x, y) {
    DllCall("SetCursorPos", "Uint", x, "Uint", y)
    Sleep, 300
    Click Down
    Sleep, 500
    Click up
    DllCall("SetCursorPos", "Uint", 0, "Uint", 0)
}

col(ARGB) { ; -- if all RGB values are above 100, return 1, otherwise return 0
    return ARGB & 255 > 100 && (ARGB >> 8) & 255 > 100 && (ARGB >> 16) & 255 > 100 ? "1" : "0" ; B G R
}

lum(ARGB) {
    B := ARGB & 255
    G := (ARGB >> 8) & 255
    R :=  (ARGB >> 16) & 255

    if (R=0)
        return "b"
    if (R+G+B>300)
        return "t"
    if (R>100 && G < 50)
        return "r"
    if (sqrt((R-57)**2+(G-60)**2+(B-66)**2) < 12)
        return "g"
}

CRC32(str, enc := "UTF-8") { ; by jNizM
	size := (StrPut(str, enc) - 1) * (len := (enc = "CP1200" || enc = "UTF-16") ? 2 : 1)
	VarSetCapacity(buf, size, 0) &&	StrPut(str, &buf, Floor(size / len), enc)
	crc := DllCall("ntdll\RtlComputeCrc32", "uint", 0, "ptr", &buf, "uint", size, "uint")
	return Format("{:x}", crc)
}

RemoveDup(obj) {
	for i, value in obj
		str.=value "`n"
	nodupArray:={}
	nodup:= "`n" 									; Added delimiter
	loop parse, str, `n
		if !InStr(nodup,  "`n"  A_LoopField "`n" )	; Added delimiter
		{
			nodup.=A_LoopField "`n"
			nodupArray.Push(A_LoopField)
		}
	Return nodupArray
}

similarity(a,b){ ; -- compare two strings
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

compare(str,nodes) { ; -- compare input icon with data set and return matching pair
    if (str = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
        return ; if the node is empty, return
    min := 90 ; min similarity
    best := null ; best match
    Loop, read, %A_ScriptDir%\src\lib\data.txt ; read the data set
    {
        data := StrSplit(A_LoopReadLine, ",") ; split into [nodename, data]

        if !InStr(nodes, data[1]) ; if we don't need it, skip it
            Continue
        if (min = 100) { ; if we found a match already, return
            return best
        }

        if ((compare := similarity(str, data[2])) > min) { ; if it is the best match so far, set as best
            min := compare
            best := data[1]
        }
    }
    return best
}

px(color) { ; made by iseahound https://www.autohotkey.com/boards/viewtopic.php?t=101819

    static hdc, hbm, obm, pBits
    if !hdc {
        ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
        hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
        VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
            NumPut(       40, bi,  0,   "uint") ; Size
            NumPut(A_ScreenWidth, bi,  4,   "uint") ; Width
            NumPut(-A_ScreenHeight, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
            NumPut(        1, bi, 12, "ushort") ; Planes
            NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
        hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
        obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")
    }

        ; Retrieve the device context for the screen.
        static sdc := DllCall("GetDC", "ptr", 0, "ptr")

        ; Copies a portion of the screen to a new device context.
        DllCall("gdi32\BitBlt"
                , "ptr", hdc, "int", 0, "int", 0, "int", A_ScreenWidth, "int", A_ScreenHeight
                , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020 | 0x40000000) ; SRCCOPY | CAPTUREBLT

            static bin := 0
            if !bin {
                ; C source code - https://godbolt.org/z/oYx39nr5s
                code := (A_PtrSize == 4)
                ? "VYnli1UIi0UMi00QjQSCOcJzDTkKdQSJ0OsFg8IE6+9dww=="
                : "idJIjQSRSDnBcw9EOQF1BInI6wZIg8EE6+zD"
                padding := (code ~= "==$") ? 2 : (code ~= "=$") ? 1 : 0
                size := 3 * (StrLen(code) / 4) - padding
                bin := DllCall("GlobalAlloc", "uint", 0, "uptr", size, "ptr")
                DllCall("VirtualProtect", "ptr", bin, "ptr", size, "uint", 0x40, "uint*", old:=0)
                DllCall("crypt32\CryptStringToBinary", "str", code, "uint", 0, "uint", 0x1, "ptr", bin, "uint*", size, "ptr", 0, "ptr", 0)
            }

            ; Pass the width * height, but the size is returned due to C interpreting Scan0 as a integer pointer.
            ; So when doing pointer arithmetic, *Scan0 + 1 is actually adding 4 bytes.
            byte := DllCall(bin, "ptr", pBits, "uint", A_ScreenWidth * A_ScreenHeight, "uint", color, "int")
            if (byte == pBits + A_ScreenWidth * A_ScreenHeight * 4)
                throw Exception("pixel not found")
            x := mod((byte - pBits) / 4, A_ScreenWidth)
            y := ((byte - pBits) / 4) // A_ScreenWidth

            return {x:x, y:y}

}

;for debugging
/*
Obj2Str(obj) {
	For k,v in obj
		Str .= k " = " v "`n"
	return RTrim(Str, "`n")
}
*/

Arr2Str(arr) {
    out:=""
    for k, v in arr
        out .= k ": " v "`n"
    return out
}

Arr2Str2(arr) {
    out:=""
    for k, v in arr
        out .= v " -> "
    return SubStr(out, 1, StrLen(out)-3)
}