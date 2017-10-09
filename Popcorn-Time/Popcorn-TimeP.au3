#NoTrayIcon
#AutoIt3Wrapper_Icon=popcorn-time.ico
#AutoIt3Wrapper_Compile_Both=y
#include <Constants.au3>
$_BASEDIR	= @ScriptDir;
$_CFGDIR	= $_BASEDIR & "\cfg\";
Run($_BASEDIR & "\Popcorn-Time.exe --data-path=" & $_CFGDIR)
