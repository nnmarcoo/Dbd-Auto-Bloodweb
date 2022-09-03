#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\src\lib\FindClick.ahk
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
width := 200
Sleep, 1000
While (FoundX < 0) {
ImageSearch, FoundX, FoundY, 0, 0, 700, 1080, *TransWhite *200 *w%width% *h-1 test.png ; 533, 480, 614, 561
width -= 1
ToolTip, %width%
}
Mousemove, FoundX+width/2, FoundY+width/2
Esc::
ExitApp
