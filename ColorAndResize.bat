@echo off 

set fileName=%1

set extension=%~x1
set size=%2

echo %fileName%
echo %extension%
	
IF /i %extension%==.jpg (
	echo Conversion needed
) else (
	echo No conversion needed
)

set gray=gray_%1

magick convert %1 -grayscale Rec709Luminance %gray%

rem colors
magick convert %gray% ( -clone 0 -fill red  -colorize 50 ) -compose multiply -composite red_%1
magick convert %gray% ( -clone 0 -fill orange  -colorize 50 ) -compose multiply -composite orange_%1
magick convert %gray% ( -clone 0 -fill yellow  -colorize 50 ) -compose multiply -composite yellow_%1
magick convert %gray% ( -clone 0 -fill green  -colorize 50 ) -compose multiply -composite green_%1
magick convert %gray% ( -clone 0 -fill blue  -colorize 50 ) -compose multiply -composite blue_%1
magick convert %gray% ( -clone 0 -fill purple  -colorize 50 ) -compose multiply -composite purple_%1

rem resize
magick red_%1 -resize "%size%x%size%" -gravity center -extent %size%x%size% reduced_red.png
magick orange_%1 -resize ""%size%x%size%"" -gravity center -extent %size%x%size% reduced_orange.png
magick yellow_%1 -resize ""%size%x%size%"" -gravity center -extent %size%x%size% reduced_yellow.png
magick green_%1 -resize ""%size%x%size%"" -gravity center -extent %size%x%size% reduced_green.png
magick blue_%1 -resize ""%size%x%size%"" -gravity center -extent %size%x%size% reduced_blue.png
magick purple_%1 -resize ""%size%x%size%"" -gravity center -extent %size%x%size% reduced_purple.png

rem delete the gray image
del /q %gray%
