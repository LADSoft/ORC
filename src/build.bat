@echo off
     set PARALLEL=%NUMBER_OF_PROCESSORS%
     if "%TRAVIS_OS_NAME%" NEQ "" (
        call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"
     )
     if "%ORANGEC_HOME%" NEQ "" (
         del /Q ..\bin\*.*
         del /Q ..\lib\*.*
         del /Q ..\include\*.*
         del /Q ..\include\win32\*.*
         del /Q ..\include\sys\*.*
         omake -DCOMPILER=MS clean -j:%NUMBER_OF_PROCESSORS%
         set BUILD_PROFILE=MS
         set TESTS=TRUE
         set PARALLEL=%NUMBER_OF_PROCESSORS%
     )
              cd c:\orc\src
              mkdir lib > NUL
              omake -j %PARALLEL%
                  IF %ERRORLEVEL% NEQ 0 (
                      goto error;
                  )
              copy c:\orc\src\orc\orc.exe c:\orc
                  omake zip
                  IF %ERRORLEVEL% NEQ 0 (
                      goto error;
                  )
                  echo succeeded
                  goto done
:error
     echo failed
     goto done
:done
     if "%TRAVIS_OS_NAME%" NEQ "" ( exit %ERRORLEVEL% )
