@echo off
rem DefaultBuild.bat 0.00             UTF-8                    dh:2014-12-26
rem The identifying ECHO is produced using the :ANNOUNCE procedure, below.

rem **** DO NOT MODIFY THIS SCRIPT IN THE SHOWDEF VC\ CODE TREE
rem ****    This version is part of the public source tree and should not
rem ****    be modified in place.  The script in the folder extracted from
rem ****    VC\Default\DefaultProject.zip is a local-only, modifiable working
rem ****    copy that this script executes when it is present where expected.

rem REQUIRE SCRIPT STORED IN THE SAME DIRECTORY (%~dp0) AS VC\DEFAULT\ CODE
IF NOT EXIST "%~dp0DefaultBuild.bat" GOTO :FAIL1
IF NOT EXIST "%~dp0Default.txt" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.zip" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.txt" GOTO :FAIL1
IF NOT EXIST "%~dp0.gitignore" GOTO :FAIL1
rem     Confirm as well as possible we're in a Default\ folder.

rem REQUIRE DEFAULTPROJECT.ZIP EXTRACTED TO SUBFOLDER
IF NOT EXIST "%~dp0DefaultProject\DefaultBuild.bat" GOTO :FAIL2

rem EXECUTE DefaultProject\DefaultBuild.bat, returning its ERROR CODE if any.
"%~dp0DefaultProject\DefaultBuild.bat" %1
rem  quotes (") required in case there are spaces in %~dp0
rem  The %1 parameter is passed through VCbind to vcvarsall to select the
rem  desired compiler case (and detect setup conflicts.
EXIT

:FAIL1
CALL :ANNOUNCE
ECHO * SCRIPT IS NOT IN THE PROPER FOLDER LOCATION
ECHO *     This DefaultBuild.bat must be located in the ShowDefs code-tree
ECHO *     VC\Default\ folder, wherever it has been located.  Nothing should
ECHO *     have been modified there.  This script may be used directly
ECHO *     so long as it is in its location with the ShowDef src\ and VC\
ECHO *     materials.
ECHO:
EXIT /B 2

:FAIL2
CALL :ANNOUNCE
ECHO * DefaultProject\DefaultBuild.bat COMMAND-LINE BUILD SCRIPT NOT FOUND
ECHO *     The DefaultProject\ folder and needed files are not found.
ECHO *     It is necessary to extract the DefaultProject.zip archive into
ECHO *     the VC\ subfolder so its version of DefaultBuild.bat or a
ECHO *     customization is present for producing a compilation using
ECHO *     the correct environment and options.
ECHO:
EXIT /B 2

:ANNOUNCE
rem Identify this script only if we're failing here.
ECHO * DefaultBuild.bat 0.00 DEFAULT VC++ COMMAND-LINE COMPILATION
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

rem 0.00 2014-12-26-11:00 Create Build Script
rem      This script verifies that VC\Default\DefaultProject\DefaultBuild.bat
rem      files are in place and defers to that script for the actual build
rem      operation.  Based on the VC\VCbind.bat script version 0.00.

rem $Header:        $

rem                 *** end of DefaultBuild.bat ***