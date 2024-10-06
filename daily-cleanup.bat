rem cleanup of your machine on login each time
rem do a cleanmgr /sageset first to select everything
rem then create a shortcut in "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rem pointing to "cmd.exe /c curl https://raw.githubusercontent.com/lyledodgegh/lyledodgegh/refs/heads/main/daily-cleanup.bat | cmd"

del /s /q %HOMEDRIVE%%HOMEPATH%\AppData\Local\Temp\*
cleanmgr /sagerun
