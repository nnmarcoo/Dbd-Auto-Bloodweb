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

Update_Buttons(Buttons) {
    for key, value in Buttons {
        ch := Set_Char(Buttons[key])
        key := key . "B"
        GuiControl ,, %key%, %ch%
    }
}

Ini_Start() {
    Loop, read, %A_ScriptDir%\src\lib\Settings.ini
    {
        val := StrSplit(A_LoopReadLine, "=")
        if (val[2] = 1)
            out .= val[1] ","
    }
    return out
}