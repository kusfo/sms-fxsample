@echo off
sdcc -c -mz80 source/main.c -o build/main.rel
sdcc -c -mz80 source/fxsample.c -o build/fxsample.rel
sdcc -c -mz80 source/bank1.c -o build/bank1.rel
if %errorlevel% neq 0 exit /b %errorlevel%
sdcc -o build/output.ihx -mz80 --data-loc 0xC000 --no-std-crt0 libraries/crt0_sms.rel build/main.rel build/fxsample.rel build/bank1.rel libraries/SMSlib.lib
if %errorlevel% neq 0 exit /b %errorlevel%
..\Tools\ihx2sms build/output.ihx sega.sms
if %errorlevel% neq 0 exit /b %errorlevel%
cd build
del *.ihx > nul
del *.lk > nul
del *.lst > nul
del *.map > nul
del *.noi > nul
del *.sym > nul
cd ..