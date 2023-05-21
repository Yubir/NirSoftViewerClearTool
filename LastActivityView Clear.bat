
REM Clearing Event logs
echo Clearing Event logs
FOR /F "tokens=*" %%G IN ('wevtutil el') DO (wevtutil cl "%%G")

REM Deleting Prefetch files
echo Deleting Prefetch files
del /q C:\Windows\Prefetch\*.pf

REM Deleting Open/Save MRU list in the Registry
echo Deleting Open/Save MRU list
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /f

REM Deleting Recent folder shortcuts
echo Deleting Recent folder shortcuts
del /q "C:\Users\%USERNAME%\Recent\*.*"

REM Deleting Windows Shell Bags Registry keys
echo Deleting Windows Shell Bags Registry keys
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell" /f

REM Deleting Software Uninstall Registry keys
echo Deleting Software Uninstall Registry keys
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f

REM Deleting Software Installation Registry keys
echo Deleting Software Installation Registry keys
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Installer\UserData" /f

REM Clearing Task Scheduler history
echo Clearing Task Scheduler history
schtasks /delete /tn * /f

REM Clearing Recent Documents history
echo Clearing Recent Documents history
powershell -command "Clear-History"

echo Log cleanup complete
pause