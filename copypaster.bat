@echo off
title copypaster 3.1

mode con cols=68 lines=20

REM %CD% - ⥪�騩 ��⠫��
REM %

set "home=%CD%"

set "zn=ffdf"

set "list=list.txt"   - 䠩� � ���஬ ���祭� .apk 䠩���
set "not_found=not_found.txt" - 䠩�  � ���������묨 �������

set "input_folder=_INPUT_APK_123"  - ����� � ������ �� �㦭� ᪮��஢���
set "output_folder=%home%/_OUT_APK_123"  - ����� � ������ �� �㦭� ᪮��஢���
set "fr_folder=%home%/_framework"  - ����� � ������ �� �㦭� ᪮��஢���



REM ᯨ᮪ ����⢨�
:m
echo [ 1 - �����஢��� APK-䠩�� �� _system � _INPUT_APK                ]
echo [ 2 - ������஢��� APK-䠩�� � ����� _OUT_APK                    ]
echo [ 3 - ������஢��� APK-䠩�� � ����� _OUT_APK � ��娢�஢���     ]
echo [ 4 - �����஢��� framework'� � ����� _framework                   ]
echo [ q - ���                                                        ]

set /p choice= ����⢨�: 
cls
goto m%choice%
if not defined choice goto m9

REM ����⢨� 1
:m1
echo [ 1 - �᭮��� �ਫ������                                          ]
echo [ 2 - ����⥯���� �ਫ������                                    ]
set /p listnumber= ����⢨�: 
goto 1list%listnumber%
echo %output_folder%
:1list1
set "list=list.txt"
set "folder=%input_folder%"
goto searchandcopy
:1list2
set "list=list2.txt"
set "folder=%input_folder%"
goto searchandcopy

:searchandcopy
 2>nul md "%folder%"
>"%not_found%" (
for /f "usebackq delims=" %%i in ("bin/lists/%list%") do (
 for /f "delims=" %%j in ('
 "2>nul dir /a-d/b/s "%%i""
 ') do (
  >nul copy "%%j" "%folder%"
  )
 )|| (
 echo %%i
 )
)
cls
REM ����� 1��
echo  [                            ��⮢�!                               ]
echo  [ Enter - � ������� ����                                           ]
echo  [ q - ���                                                        ]
set /p choicemenu = ����⢨�: 
cls
goto m%choicemenu%
REM ����⢨� 2
:m2
cd %output_folder%
set "list_app=list_app.txt"
set "list_priv=list_priv.txt"
set "list_mz=list_mz.txt"
set "list_fr=list_fr.txt"
goto 2list_app
:2list_app
set "list=%list_app%"
mkdir app >nul 2>nul
set "folder=app"
set "gt=2list_fr"
goto move_in_out
:2list_fr
set "list=%list_fr%"
mkdir framework >nul 2>nul
set "folder=framework"
set "gt=2list_priv"
goto move_in_out
:2list_priv
set "list=%list_priv%"
mkdir priv-app >nul 2>nul
set "folder=priv-app"
set "gt=2list_mz"
goto move_in_out
:2list_mz
set "list=%list_mz%"
mkdir MzApp >nul 2>nul
set "folder=MzApp"
set "gt="
if "%choice%"=="3"( echo
echo �롥�� ��� ��� ��娢 .7z
set /p zn= ��� ��� ��娢�: 
echo %zn%
cd ..
cd bin
7z a -tzip -mx0 -r0 -x!*.exe -x!*.7z -x!*.txt %output_folder%/putt_"%zn%".7z %output_folder% >nul 2>nul
) else
goto 2end
:move_in_out
 2>nul md "%folder%"
>"%not_found%" (
for /f "usebackq delims=" %%i in ("%home%/bin/lists/%list%") do (
 for /f "delims=" %%j in ('
 "2>nul dir /a-d/b/s "%%i""
 ') do (
  >nul move "%%j" "%folder%"
  )
 )|| (
 echo %%i
 )
)
goto %gt%
:2end
echo [                            ��⮢�!                               ]
echo [ Enter - � ������� ����                                           ]
echo [ q - ���                                                        ]
set /p choicemenu = ����⢨�: 
cls
goto m%choicemenu%
REM ����⢨� 3
:m3
goto m2
:m4
cd %input_folder%
copy *-res.apk %fr_folder%
echo [                            ��⮢�!                               ]
echo [ Enter - � ������� ����                                           ]
echo [ q - ���                                                        ]
set /p choicemenu = ����⢨�: 
cls
goto m%choicemenu%
pause
:mq
pasue /b