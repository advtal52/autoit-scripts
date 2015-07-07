#NoTrayIcon
#RequireAdmin
#AutoIt3Wrapper_Icon=popcorn-time.ico
#AutoIt3Wrapper_Compile_Both=y
#include <Constants.au3>

$_BASEDIR		= @ScriptDir;
$_CFGDIR		= $_BASEDIR & "\cfg\";
$_APPDATADIR		= RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', 'Local AppData');
$_POPCORN_TIME_LOCAL	= $_APPDATADIR & "\Popcorn-Time";

TEST_DIRECTORY()

Func TEST_DIRECTORY()
    If FileExists($_POPCORN_TIME_LOCAL) Then
		RUN_POPCORN_TIME()
		TEST_PROCESS_RUNNIG()
    Else
		CREATE_JUNCTION_DIRECTORY()
		RUN_POPCORN_TIME()
	        TEST_PROCESS_RUNNIG()
    EndIf
EndFunc


Func RUN_POPCORN_TIME()
	Run($_BASEDIR & "\Popcorn-Time.exe")
EndFunc

Func TEST_PROCESS_RUNNIG()
	While True
		If Not ProcessExists("Popcorn-Time.exe") Then
			DELETE_JUNCTION_DIRECTORY()
			ExitLoop
		EndIf
		Sleep (5000)
	WEnd
EndFunc

Func DELETE_JUNCTION_DIRECTORY()
	$_MYCMD = @ComSpec & " /c ";
	$_COMMAND = $_MYCMD & "rd" & " " & $_POPCORN_TIME_LOCAL;
	Run($_COMMAND, @TempDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD);
EndFunc

Func CREATE_JUNCTION_DIRECTORY()
	$_MYCMD = @ComSpec & " /c ";
	$_COMMAND = $_MYCMD & "mklink /D" & " " & $_POPCORN_TIME_LOCAL & " " & $_CFGDIR;
	Run($_COMMAND, @TempDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD);
EndFunc
