#AutoIt3Wrapper_icon=git.ico
local $BASEDIR = @ScriptDir
Switch @OSArch
    Case "X86"
        local $BINAY = "smartgit.exe"
    Case "X64"
        local $BINAY = "smartgit64.exe"
    Case Else
			MsgBox(0, "", "WTF!")
			Exit
EndSwitch
;~ MsgBox(0, "", "subst G: " & $BASEDIR & "\PROYECTOS")
Run($BASEDIR & "\nircmd.exe execmd subst G: " & $BASEDIR & "\PROYECTOS")
Local $iPID = Run($BASEDIR & "\SmartGit\bin\" & $BINAY )
ProcessWaitClose($iPID)
;~ MsgBox(0, "", "sarasa")
Run($BASEDIR & "\nircmd.exe execmd subst /d G:")


