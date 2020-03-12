@echo off

rem Set variables
set PROJECT_NAME=SimpleAudioScope
set ARCHITECTURE=x64
set BUILD_CONFIG=Release

rem Set global search paths for JUCE modules
cd %~dp0
.\Projucer\Projucer.exe --set-global-search-path windows defaultJuceModulePath JUCE

rem Generate IDE project file(.sln) by Projucer
cd %~dp0
.\Projucer\Projucer.exe --resave %PROJECT_NAME%.jucer

rem Start Visual Studio 2015's Developer Command Line Tool
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

rem Build by MSBuild
cd %~dp0
MSBuild .\Builds\VisualStudio2019\%PROJECT_NAME%.sln /t:clean;rebuild /p:Configuration=%BUILD_CONFIG%;Platform=%ARCHITECTURE%
if %ERRORLEVEL% neq 0 goto FAILURE

rem Copy artifact to bin folder
cd %~dp0
mkdir bin
copy /Y .\Builds\VisualStudio2019\%ARCHITECTURE%\%BUILD_CONFIG%\VST3\%PROJECT_NAME%.vst3 .\bin\%PROJECT_NAME%.vst3
if %ERRORLEVEL% neq 0 goto FAILURE

goto SUCCESS

:FAILURE
echo ErrorLevel:%ERRORLEVEL%
echo Build Failed

:SUCCESS
echo Build Success