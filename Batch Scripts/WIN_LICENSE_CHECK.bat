@echo off
cd C:\Windows\System32
cscript slmgr.vbs /dlv
cd %HOMEPATH%
pause