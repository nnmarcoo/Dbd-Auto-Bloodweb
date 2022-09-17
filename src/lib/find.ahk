#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

find(img, x1=0, y1=0, x2=1920, y2=1080, confThreshold=100) { ; add <deviation>
	CoordMode, Pixel, Screen
	CoordMode, Mouse, Screen
	SetFormat, Integer, D ; set up
   currConfidence := 0 ; Confidence of current searched area
   arr := []

   pToken := Gdip_Startup() ; set up
   pBitmap := Gdip_CreateBitmapFromFile(img) ; pBitmap is the source image
	sBitmap := Gdip_BitmapFromScreen(x1 "|" y1 "|" x2 "|" y2) ; sBitmap is the search area image
	Gdip_GetImageDimensions(pBitmap, pw, ph) ; pw = source width, ph = source height
	Gdip_GetImageDimensions(sBitmap, sw, sh) ; sw = search are width, sh = search area height

	Gdip_DisposeImage(pBitmap) ; shut down
	Gdip_DisposeImage(sBitmap) ; shut down
	Gdip_Shutdown(pToken) ; shut down
}

deepcheck(screen, bitmap, x, y, w, h, thres) {
   for i in Step(x, w, Ceil(w*.1))
      for j in Step(y, h, Ceil(h*.1)) {
         mousemove, i, j,0
         searched += 1
         if (Gdip_GetPixel(screen, x+i, y+j) = Gdip_GetPixel(bitmap, i, j))
            correct += 1
         tooltip % correct / searched * 100
         if (correct / searched * 100 > thres)
            Continue
         return
      }
}

ObjIndexOf(obj, item, case_sensitive:=false)
{
	for i, val in obj {
		if (case_sensitive ? (val == item) : (val = item))
			return i
	}
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

px(color) {

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
         ;if (byte == pBits + A_ScreenWidth * A_ScreenHeight * 4)
            ;throw Exception("pixel not found")
         x := mod((byte - pBits) / 4, A_ScreenWidth)
         y := ((byte - pBits) / 4) // A_ScreenWidth

         return {x:x, y:y}

}

Median(List)

{

	Sort, List, N D,  ; Sort numerically, use comma as delimiter.



	;Create Array

	StringSplit, Set, List, `,

;Figure if odd or even

	R := Set0 / 2

	StringSplit, B, R, .

	StringLeft, C, B2, 1

	;Even

	If C = 0

	{

		pt1 := B1 + 1

		Med := (Set%B1% + Set%pt1%) / 2

	}

	;Odd

	Else

	{

		Med := Ceil(R)

		Med := Set%Med%	

	}

	Return Med

}