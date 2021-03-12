@echo off

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin

setlocal

:start

set from=
set to=

echo "移動するディレクトリを指定してください"
set /P from=
echo "移動先ディレクトリを指定してください"
set /P to=

xcopy /E /I /Q %from% %to%

for /F "delims=" %%A in ("%from%") do set name=%%~nxA

rename %from% %name%.bak

mklink /D %from% %to%

goto start

:NotAdmin 
echo "管理者権限で実行してください"
:End