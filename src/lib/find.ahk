find("C:\Users\marco\Documents\GitHub\Dbd-Auto-Perks\test.png", 0, 0, (A_ScreenWidth // 3) * 2, A_ScreenHeight)


#include Gdip.ahk

find(img, x1, y1, x2, y2, confThreshold=100) { ; add <confidence> and <deviation>
    srcpxls := {} ; array to put src pxl colors in
    screenpxls := {} ; array to put screen pxl colors in
    currConfidence := 0 ; Confidence of current searched area

    imgDim(img, w, h) ; get width and height of src img
    pToken := Gdip_Startup() ; set up
    pBitmap := Gdip_CreateBitmapFromFile(img) ; set up
    SetFormat, Integer, H ; set up

    For col in Step(1, w) ; for each column
        For row in Step(1, h) ; ...look at each pixel
            srcpxls.Insert(Gdip_GetPixel( pBitmap, col, row ) + 0) ; record the pixel color in array
    Gdip_DisposeImage(pBitmap) ; shut down
    Gdip_Shutdown(pToken) ; shut down

    For col in Step(x1, x2) ; for each column
        For row in Step(y1, y2) { ; ...look at each pixel
            PixelGetColor, px, col, row ; get pixel color
            screenpxls.Insert(px) ; record pixel color in array
        }
}


imgDim(img, ByRef width, ByRef height) { ; Get image's dimensions
 If FileExist(img) {
  GUI, Add, Picture, hwndpic, %img%
  ControlGetPos,,, width, height,, ahk_id %pic%
  Gui, Destroy
 } Else height := width := 0
 Return width
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