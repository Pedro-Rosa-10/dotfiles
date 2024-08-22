@echo off
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "datestamp=%dt:~6,2%%dt:~4,2%-%dt:~8,2%%dt:~10,2%"
echo %datestamp% | clip
echo %datestamp%
