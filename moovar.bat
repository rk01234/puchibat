@echo off
openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin

setlocal

:start

set from=
set to=

echo "�ړ��������t�H���_���w�肵�Ă�������"
set /P from=
echo "�ړ���t�H���_���w�肵�Ă�������"
set /P to=

xcopy /E /I /Q %from% %to%
xcopy /E /I /Q %from% %from%.bak

rmdir /s /q  %from%
mklink /D %from% %to%

goto start

:NotAdmin 
echo "�Ǘ��Ҍ����Ŏ��s���Ă�������"
:End