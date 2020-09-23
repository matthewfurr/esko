@echo off
rem First script argument contains the input file paths
set inputs=%1
rem Trim surrounding quotes
for /f "usebackq tokens=*" %%a in ('%inputs%') do set inputs=%%~a
rem Get the output folder
set outputFolder=%2
rem Get the maximum size from the script parameters
rem and convert from megabyte to bytes
set /a maxSize=%3*1000000
set exitValue=0
rem Iterate through the input file paths which are separated by ';'
:ITERATE_INPUTS
if "%inputs%"=="" goto EXIT
for /f "tokens=1 delims=;" %%a in ("%inputs%") do call :HANDLE_INPUT "%%a"
for /f "tokens=1* delims=;" %%a in ("%inputs%") do set inputs=%%b
goto ITERATE_INPUTS
:HANDLE_INPUT
rem Get the size of the input
for %%? in (%1) do set inputSize=%%~z?
rem Check wether the input is OK to copy
if %inputSize% lss %maxSize% (
rem Copy input to output folder
copy /y %1 %outputFolder%
) else (
echo %1 is too big to copy
set exitValue=1
)
goto :eof
:EXIT
exit %exitValue%
