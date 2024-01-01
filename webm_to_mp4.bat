@echo off

set /p input_file=Enter the input file name (including extension): 
set /p output_file=Enter the output file name (including extension): 

echo Select the encoding speed preset:
echo   1. Slow
echo   2. Fast
echo   3. Faster
echo   4. Ultrafast
choice /c 1234 /n /m "Enter your choice: "

set encoding_preset=ultrafast
if errorlevel 4 set encoding_preset=ultrafast
if errorlevel 3 set encoding_preset=faster
if errorlevel 2 set encoding_preset=fast
if errorlevel 1 set encoding_preset=slow

ffmpeg -i "%input_file%" -c:v libx264 -preset %encoding_preset% -crf 22 -c:a aac -b:a 128k "%output_file%"

echo Conversion completed.
