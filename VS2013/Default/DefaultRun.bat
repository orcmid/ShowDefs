@echo off
rem DefaultRun.bat 0.03               UTF-8                    dh:2014-12-15
rem The identifying line is produced using the :ANNOUNCE procedure.

rem **** DO NOT MODIFY THIS SCRIPT IN THE SHOWDEF VS2013\DEFAULT CODE TREE
rem ****    This version is part of the public source tree and should not
rem ****    be modified in place.  The script in the folder extracted from
rem ****    DefaultProject.zip is a local-only, modifiable working copy.

rem REQUIRE SCRIPT STORED IN THE SAME DIRECTORY (%~dp0) AS DEFAULT\ CODE
IF NOT EXIST "%~dp0DefaultRun.bat" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.txt" GOTO :FAIL1
IF NOT EXIST "%~dp0DefaultProject.zip" GOTO :FAIL1
IF NOT EXIST "%~dp0Default.txt" GOTO :FAIL1
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
ECHO *     VS2013\Default\ folder, wherever it has been located.  Nothing
ECHO *     should have been modified there.  The script may be referenced
ECHO *     so long as it is in a location with the Default\ material.
ECHO:
EXIT /B 2

:FAIL2
CALL :ANNOUNCE
ECHO * DEFAULTPROJECT\ SOLUTION FILES NOT FOUND
ECHO *     The DefaultProject\ folder and needed files are not found.
ECHO *     It is necessary to extract the DefaultProject.zip archive into
ECHO *     the DefaultProject\ subfolder and use Visual Studio to employ the
ECHO *     Default.sln and other files to build Default.exe.  For details of
ECHO *     that procedure, consult file DefaultProject.txt.
ECHO:
EXIT /B 2

:ANNOUNCE
rem Identify this script only if we're done here.
ECHO * DefaultRun.bat 0.03 SHOW DEFAULT VS2013 VC PROJECT #DEFINE VARIABLES
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

rem 0.03 2014-12-15-18:00 Simplify the validation to the minimum required to
rem      do the job, and then use the DefaultProject\DefaultRun.bat.
rem 0.02 2014-12-14-14:36 Change to work relative to script location
rem      %~dp0 qualifiers signify the d:\p\, the drive and path where the
rem      script is located at, upgrading checks to the latest DefaultProject\
rem      structure.
rem 0.01 2014-12-08-16:49 Adjust Error Messages
rem      Improve checks and messages after DefaultProject.zip version review.
rem 0.00 2014-12-08-16:01 Create Run Script
rem      The script verifies that the prerequisites are in place before
rem      attempting to execute Default.exe.

rem $Header:        $

rem                     *** end of DefaultRun.bat ***