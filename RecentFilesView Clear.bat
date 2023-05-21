echo Clearing Recent log
del /Q /F "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\*.*"

echo Clearing Regedit
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /f

pause