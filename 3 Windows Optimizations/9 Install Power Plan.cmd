@echo off
echo
echo install power plan
powercfg -import "C:\FR33THY Optimization Pack\3 Windows Optimizations\_Files\Bitsum Highest Performance.pow" 77777777-7777-7777-7777-777777777777
echo
echo set power plan active
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777"
echo
echo delete balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
echo
echo delete high performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo
echo delete power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
echo
echo disable hibernate
powercfg -h off
echo
echo check power plan
powercfg.cpl
