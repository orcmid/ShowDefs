@echo off
rem DefaultRun.bat 0.01               UTF-8                    dh:2014-12-08
ECHO * DefaultRun.bat 0.01 SHOW DEFAULT VS2013 VC PROJECT #DEFINE VARIABLES
ECHO:

rem **** TO CUSTOMIZE THIS SCRIPT, COPY TO A SEPARATE WORKING LOCATION
rem ****    This version is part of the public source tree and should not
rem ****    be customized locally.  An alternative is to customize the
rem ****    version that is extracted from DefaultProject.zip.  That one can
rem ****    be customized in DefaultProject\ without source-tree impact.

rem REQUIRE EXECUTION IN THE SAME DIRECTORY AS THE SCRIPT
IF NOT EXIST "DefaultRun.bat" GOTO :FAIL1
IF NOT EXIST "DefaultProject.txt" GOTO :FAIL1
IF NOT EXIST "DefaultProject.zip" GOTO :FAIL1
IF NOT EXIST "Default.txt" GOTO :FAIL1
rem     Confirm as well as possible we're in the correct project location

rem REQUIRE DEFAULTPROJECT.ZIP EXTRACTED
IF NOT EXIST "DefaultProject\Default.sln" GOTO :FAIL2
IF NOT EXIST "DefaultProject\Default.vcxproj" GOTO :FAIL2
IF NOT EXIST "DefaultProject\Default.vcxproj.filters" GOTO :FAIL2
IF NOT EXIST "DefaultProject\DefaultProject.txt" GOTO :FAIL2

rem REQUIRE DEFAULT.EXE COMPILED
IF NOT EXIST "DefaultProject\Release\Default.exe" GOTO :FAIL3

rem EXECUTE DEFAULT.EXE
DefaultProject\Release\Default.exe
ECHO:
EXIT /B 0

:FAIL1
ECHO * EXECUTION IS NOT IN THE PROPER FOLDER LOCATION
ECHO *     This DefaultRun.bat must be executed in the ShowDefs code-tree
ECHO *     folder VS2013\Default\ where it is stored.  Nothing should have
ECHO *     been deleted there.  Change the current working directory to that
ECHO *     location and re-attempt.
ECHO:
EXIT /B 2

:FAIL2
ECHO * DEFAULTPROJECT\ SOLUTION FILES NOT FOUND
ECHO *     The DefaultProject\ folder with needed solution files is not found.
ECHO *     It is necessary to extract the DefaultProject.zip archive into
ECHO *     the DefaultProject\ subfolder and use Visual Studio to employ the
ECHO *     Default.sln and other files to build Default.exe.  For details of
ECHO *     that procedure, consult file DefaultProject.txt.
ECHO:
EXIT /B 2

:FAIL3
ECHO * DEFAULT.EXE NOT FOUND
ECHO *     Successful build of the Default Project will produce the file
ECHO *     DefaultProject\Release\Default.exe.  Verify that the Visual Studio
ECHO *     solution has been opened and a successful build completed.  For
ECHO *     details of VS2013 solution-building, consult file VS2013.txt
ECHO *     in the ShowDefs VS2013\ folder.
ECHO:
EXIT /B 2

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

rem 0.01 2014-12-08-16:49 Adjust Error Messages
rem      Improve checks and messages after DefaultProject.zip version review.
rem 0.00 2014-12-08-16:01 Create Run Script
rem      The script verifies that the prerequisites are in place before
rem      attempting to execute Default.exe.

rem $Header:        $

rem                     *** end of DefaultRun.bat ***