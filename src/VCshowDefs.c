/* VCshowDefs.c 1.23                  UTF-8                       2014-12-10
 *
 *             SHOW PRESENCE OF VISUAL C++ PREPROCESSOR DEFINES
 *
 *      Program to report on selected compiler definitions that were
 *      set or not when it was compiled.
 *
 *      Compile this program as a console application in any configura-
 *      tion of a VC++ compiler.  Execution of the program prints a
 *      a list of selected pre-processor variables with either their
 *      value, the notation "is defined" or the notation "undefined".
 *
 *   Copyright 2005,2014 Dennis E. Hamilton
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */


#include <stdio.h>
      /* for stdout, fputs() and fputc() */

#include <string.h>
      /* for strlen() */

#define TV(X) #X ""
      /* Always produce a string, even when X is empty */

#define SHOW(X, SP) fputs(SP #X " ", stdout);  \
                    fputs( ( tv = TV(X), \
                             strlen(tv) == 0 \
                                ? "is defined" \
                                : strcmp(tv, #X) == 0 \
                                     ? "undefined" \
                                     : TV(is defined to X) ), \
                           stdout); \
                    fputc('\n', stdout);

      /* The macro prints a line where the token X is right-justified
         after the string of spaces SP, and then followed with one of
         " is defined" (with no value), " undefined" (with no value)
         or " is defined to " followed by what X is #define-ed to.
         See the body of main() to see how to add and vary the pre-
         processor definitions to check for.
            See the companion file, showdefs.txt for ways to compile
         the program to discover the settings that were applied at
         compile time.
            See the main() function for declaration of the string
         variable tv that is set and used in the SHOW macro.
         */

#ifdef _MSC_VER
#pragma warning(disable: 4003)
   /* Do not warn about TV(x) when not enough parameters (i.e., x empty) */
#endif


int main(void)
   {/* Report the status of predefined pre-processor variables that
       were defined or not when this program was compiled.
       */

       char *tv;  /* pointer to the token value string */

       fputs(  "VCshowDefs> 1.23 Check for documented pre-processor macros", 
              stdout);
       fputs("\n            that might be predefined in this compile.\n", 
              stdout);


       fputs("\n  Supported ANSI/ISO Macros:\n", stdout);

       SHOW(__DATE__, "                ");
       SHOW(__FILE__, "                ");
       SHOW(__LINE__, "                ");
       SHOW(__STDC__, "                ");
       SHOW(__TIME__, "                ");

       fputs("\n  Supported (VC++?) reflection support:\n", stdout);

       SHOW(__COUNTER__, "             ");
       SHOW(__cplusplus, "             ");
       SHOW(__FUNCTION__, "            ");
       SHOW(__FUNCDNAME__, "           ");
       SHOW(__FUNCSIG__, "             ");
       SHOW(__TIMESTAMP__, "           ");

       fputs("\n  VC++ MS-Specific Macros:\n", stdout);

       SHOW(_ATL_VER, "                ");
       SHOW(_CHAR_UNSIGNED, "          ");
       SHOW(_CPPLIB_VER, "             ");
       SHOW(_CPPRTTI, "                ");
       SHOW(_CPPUNWIND, "              ");
       SHOW(_DEBUG, "                  ");
       SHOW(_DLL, "                    ");
       SHOW(_M_ALPHA, "                ");
       SHOW(_M_IA64, "                 ");
       SHOW(_M_IX86, "                 ");
       SHOW(_M_MPPC, "                 ");
       SHOW(_M_MRX000, "               ");
       SHOW(_M_PPC, "                  ");
       SHOW(_MANAGED, "                ");
       SHOW(_MFC_VER, "                ");
       SHOW(_MSC_EXTENSIONS, "         ");
       SHOW(_MSC_VER, "                ");
       SHOW(__MSVC_RUNTIME_CHECKS, "   ");
       SHOW(_MT, "                     ");
       SHOW(_NATIVE_WCHAR_T_DEFINED, " ");
       SHOW(_WCHAR_T_DEFINED, "        ");
       SHOW(_WIN32, "                  ");
       SHOW(_WIN64, "                  ");

       fputs("\n  And some favorites when compiling Windows code:\n", 
             stdout);

       SHOW(_INC_WINDOWS, "            ");
       SHOW(_MAC, "                    ");
       SHOW(RC_INVOKED, "              ");
       SHOW(WIN32_LEAN_AND_MEAN, "     ");
       SHOW(_WIN32NLS, "               ");
       SHOW(_WINDEF_, "                ");
       SHOW(_WINDOWS_, "               ");
       SHOW(WINVER, "                  ");
       SHOW(_X86_, "                   ");


       /* This list can be extended to check known predefines of
          other compilers too.  This program is the basis for
          being able to confirm the settings and options as part
          of making sure that a build condition is reproducible by
          making defaults explicit.
          */

       return 0;

       } /* main() */



/*    1.23 2014-12-10-17:54 Switch from printf(s) to fputs(s, stdout)
 *         The SHOW macro and all direct output is changed to fputs()
 *         and fputc() using stdout, just for simplicity of operation.
 *    1.22 2014-12-10-16:03 Use int main(void)
 *         Changed for compiling with no complaints using /Wall warnings
 *    1.21 2014-12-03-17:17 Renamed VCshowdefs.c to emphasize the focus on
 *         defines that apply in VC++ compiles in Visual Studio and with the
 *         command-line compiler.  Put under Apache License Version 2.0.
 *    1.20 2014-12-02-18:05 Reviving this little toy to help me verify some
 *         peculiar treatment of code by GCC under MSYS2.  I can't figure out
 *         where some defines are being set and why.  Reorganized and added
 *         more explanatory comments.  Other comments on build cases moved
 *         to separate documentation.
 *    1.10 2005-09-14-07:48 Put in some conditional code around the pragma
 *         and add information for compiling as either C, C++, and C++
 *         without exception handling to show the differences in the
 *         settings that the compiler figures out from the name of the
 *         source program.  Add more "documentation " inspired by my
 *         long-distance pair-programming buddy Bill Anderson's running this
 *         against GCC.
 *    1.01 2005-09-13-22:43 correct the number of underscores in front of
 *         cplusplus and MSVC_RUNTIME_CHECKS
 *    1.00 2005-09-13-16:09 This programs uses preprocessor tricks to see
 *         what the settings of possibly pre-defined macros are.
 *
 * $Header:  $
 */
/*                        *** end of VCshowDefs.c ***                      */
