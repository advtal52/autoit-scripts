#AutoIt3Wrapper_icon=git.ico
local $BASEDIR = @ScriptDir
$_FILEEXT 	= 	StringRight(@ScriptName, 4)
$_FILENAME 	= 	StringReplace(@ScriptName, $_FILEEXT, "")
$_FILEINI	= 	$_FILENAME & ".ini"

$_PROYECTSDIR =	IniRead ( $_FILEINI, "CONFIG", "PROYECTS", "" )

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
Run($BASEDIR & "\nircmd.exe execmd subst G: " & $_PROYECTSDIR )
Local $iPID = Run($BASEDIR & "\SmartGit\bin\" & $BINAY )
ProcessWaitClose($iPID)
;~ MsgBox(0, "", "sarasa")
Run($BASEDIR & "\nircmd.exe execmd subst /d G:")
exit