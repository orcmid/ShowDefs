@echo off
rem DefaultRun.bat 0.02               UTF-8                    dh:2014-12-27
rem The identifying line is produced using the :ANNOUNCE procedure.

rem **** DO NOT MODIFY THIS SCRIPT IN THE SHOWDEF VC\DEFAULT CODE TREE
rem ****    This version is part of the public source tree and should not
rem ****    be modified in place.  The script in the folder extracted from
rem ****    DefaultProject.zip is a local-only, modifiable working copy.

rem REQUIRE SCRIPT STORED IN THE SAME DIRECTORY (%~dp0) AS DEFAULT\ CODE
IF NOT EXIST "%~dp0.gitignore" GOTO :FAIL1
IF NOT EXIST "%~dp0Default.txt" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultBuild.bat" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.txt" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.zip" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultRun.bat" GOTO :FAIL1
rem     Confirm as well as possible we're in a Default\ folder.

rem REQUIRE DEFAULTPROJECT.ZIP EXTRACTED TO SUBFOLDER
IF NOT EXIST "%~dp0DefaultProject\DefaultRun.bat" GOTO :FAIL2

rem EXECUTE DEFAULT.EXE
"%~dp0DefaultProject\DefaultRun.bat"
rem  quotes (") required in case there are spaces in %~dp0
EXIT

:FAIL1
CALL :ANNOUNCE
ECHO * SCRIPT IS NOT IN THE PROPER FOLDER LOCATION
ECHO *     This DefaultRun.bat must be located in the ShowDefs code-tree
ECHO *     VC\Default\ folder, wherever it has been located.  Nothing
ECHO *     should have been modified there.  The script may be operated
ECHO *     so long as it is in a location with the Default\ material.
ECHO:
EXIT /B 2

:FAIL2
CALL :ANNOUNCE
ECHO * DEFAULTPROJECT\ COMPILATION FILES NOT FOUND
ECHO *     The DefaultProject\ folder and needed files are not found.
ECHO *     It is necessary to extract the DefaultProject.zip archive into
ECHO *     the DefaultProject\ subfolder and use DefaultBuild.bat to build
ECHO *     Default.exe.  For details, consult file DefaultProject.txt
ECHO:
EXIT /B 2

:ANNOUNCE
rem Identify this script only if we're failing here.
ECHO * DefaultRun.bat 0.02 SHOW DEFAULT VC COMPILATION #DEFINE VARIABLES
ECHO:
EXIT /B 0
rem Exit /B code required to prevent global exit.

rem -----1---------2---------3---------4---------5---------6---------7-------*

rem                    Copyright 2014 Dennis E. Hamilton
rem
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

rem -----1---------2---------3---------4---------5---------6---------7-------*

rem 0.02 2014-12-27-16:30 Restore Full Filter
rem      The file requirement is restored and checked in alphabetical order
rem 0.01 2014-12-27-08:49 Correct %-dp0 to %~dp0
rem      Correct syntax error in the DefaultBuild.run check
rem 0.00 2014-12-26-11:04 Initial Run Script
rem      The script is forked from VS2013\Default\DefaultRun.bat 0.03 and
rem      customized for employment as VC\Default\DefaultRun.bat.

rem $Header:        $

rem                     *** end of DefaultRun.bat ***