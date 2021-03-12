@echo off
openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin

setlocal

:start

set from=
set to=

echo "移動したいフォルダを指定してください"
set /P from=
echo "移動先フォルダを指定してください"
set /P to=

xcopy /E /I /Q %from% %to%
xcopy /E /I /Q %from% %from%.bak

rmdir /s /q  %from%
mklink /D %from% %to%

goto start

:NotAdmin 
echo "管理者権限で実行してください"
:End