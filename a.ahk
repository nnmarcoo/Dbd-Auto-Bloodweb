CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetFormat, Integer, D
#include C:\Users\marco\Documents\GitHub\Dbd-Auto-Perks\src\lib\Gdip.ahk

tests := 1000
pToken := Gdip_Startup()
sBitmap := Gdip_BitmapFromScreen("0|0|1920|1080")
;Sleep, 1000
WinGet, active_id, ID, A

x := 677
y := 426
dist := 68
arr := []

import := [677,425,783,486,783,610,677,671,573,610,573,486,740,316,855,378,919,488,919,611,856,722,740,784,616,784,500,720,437,611,437,489,500,378,615,315,678,197,858,245,988,376,1038,549,989,723,858,855,678,903,497,855,367,724,318,550,367,375,498,245]

for := import.Length() // 2


Loop, %tests% {
DllCall("QueryPerformanceFrequency", "Int64*", freq)
DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)

asd := compare("awdawdawd","adwawdadw")

DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
total += (CounterAfter - CounterBefore) / freq * 1000
}
MsgBox % "Elapsed QPC time is " . total / 500 " ms " asd
ExitApp

Similarity(a,b){
	StringSplit, a,a
	StringSplit, b,b
	LoopCount := (a0 > b0) ? a0 : b0
	Loop, % LoopCount
	{
		if (a%A_Index% = b%A_index%)
			matches++
	}
	return (!matches) ? 0 : Round(matches//LoopCount*100)
}



PixelColorSimple(pc_x, pc_y, pc_wID)
{
    if pc_wID
    {
        pc_hDC := DllCall("GetDC", "UInt", pc_wID)
        pc_fmtI := A_FormatInteger
        SetFormat, IntegerFast, Hex
        pc_c := DllCall("GetPixel", "UInt", pc_hDC, "Int", pc_x, "Int", pc_y, "UInt")
        pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
        pc_c .= ""
        SetFormat, IntegerFast, %pc_fmtI%
        DllCall("ReleaseDC", "UInt", pc_wID, "UInt", pc_hDC)
        return pc_c
    }
}

class FastPixelSearch
{
   __New(x, y, w, h) {
      this.hBM := this.Api.HBitmapFromScreen(x, y, w, h, pvBits)
      this.pvBits := pvBits
      this.w := w
      this.size := w*h
   }
   
   Search(colorRGB) {
      static bin := 0
      (!bin && bin := this.Api.GetBin())
      (!(colorRGB >> 24) && colorRGB |= 0xFF000000)
      byte := DllCall(bin, "ptr", this.pvBits, "UInt", this.size, "UInt", colorRGB, "Int")
      if (byte == this.pvBits + this.size * 4)
         Return false
      offset := (byte - this.pvBits)//4
      Return {x: mod(offset, this.w), y: offset//this.w}
   }
   
   class Api
   {
      GetBin() {
         static PAGE_EXECUTE_READWRITE := 0x40, CRYPT_STRING_BASE64 := 0x1
         ; C source code - https://godbolt.org/z/oYx39nr5s
         code := A_PtrSize = 8 ? "idJIjQSRSDnBcw9EOQF1BInI6wZIg8EE6+zD"
                               : "VYnli1UIi0UMi00QjQSCOcJzDTkKdQSJ0OsFg8IE6+9dww=="
         size := StrLen( RTrim(code, "=") )*3//4
         bin := DllCall("GlobalAlloc", "UInt", 0, "Ptr", size, "Ptr")
         DllCall("VirtualProtect", "Ptr", bin, "Ptr", size, "UInt", PAGE_EXECUTE_READWRITE, "UIntP", old:=0)
         DllCall("crypt32\CryptStringToBinary", "Str", code, "UInt", 0, "UInt", CRYPT_STRING_BASE64
                                              , "Ptr", bin, "UIntP", size, "Ptr", 0, "Ptr", 0)
         Return bin
      }
      
      HBitmapFromScreen(X, Y, W, H, ByRef pvBits) {
         static rop := (SRCCOPY := 0x00CC0020) | (CAPTUREBLT := 0x40000000)
         hDC := DllCall("GetDC", "Ptr", 0, "Ptr")
         hBM := this.CreateDIBSection(W, H, hDC, pvBits)
         hMDC := DllCall("CreateCompatibleDC", "Ptr", hDC, "Ptr")
         hObj := DllCall("SelectObject", "Ptr", hMDC, "Ptr", hBM, "Ptr")
         DllCall("BitBlt", "Ptr", hMDC, "Int", 0, "Int", 0, "Int", W, "Int", H
                         , "Ptr", hDC, "Int", X, "Int", Y, "UInt", rop)
         DllCall("SelectObject", "Ptr", hMDC, "Ptr", hObj, "Ptr")
         DllCall("DeleteDC", "Ptr", hMDC)
         DllCall("ReleaseDC", "Ptr", 0, "Ptr", hDC)
         Return hBM
      }

      CreateDIBSection(w, h, hDC, ByRef pvBits) {
         VarSetCapacity(BITMAPINFO, 40, 0)
         NumPut(40, BITMAPINFO,  0)
         NumPut( w, BITMAPINFO,  4)
         NumPut(-h, BITMAPINFO,  8)
         NumPut( 1, BITMAPINFO, 12)
         NumPut(32, BITMAPINFO, 14)
         hBM := DllCall("CreateDIBSection", "Ptr", hDC, "Ptr", &BITMAPINFO, "UInt", 0
                                          , "PtrP", pvBits, "Ptr", 0, "UInt", 0, "Ptr")
         return hBM
      }
   }
   
   __Delete() {
      DllCall("DeleteObject", "Ptr", this.hBM)
   }
}

getpixel(x, y) {
    return Gdip_GetPixel(sBitmap, x, y)
}

step(Start, End, Step=1) { ; written by Lexikos
    static base := Object("_NewEnum", "step_enum", "Next", "step_next")
    return Object(1, Start-Step, 2, End, 3, Step, "base", base)
}
step_enum(list) {
   return list
}
step_next(list, ByRef var) {
   return (var := list[1] := list[1] + list[3]) <= list[2]
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

            if (min = 100) ; if we found a match already, return
                return best
                
            if (compare > min) { ; if it is the best match so far, set as best
                min := compare
                best := data[1]
            }
    }
    return best
}

compare2(str,nodes) {
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

