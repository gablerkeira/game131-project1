@echo off 

set fileName=%1

set extension=%~x1

set size=%2

if /i %~1==help (
	echo To Use: 
	echo Rainbow.bat name of image.jpg size as a number
	echo IE: Rainbow.bat nothing.jpg 512
	echo size must be between 32x32 and 1024x1024
	echo Turns an image rainbow, then resizes the rainbow images
	exit /b
)

IF /i %extension%==.jpg (
	echo Conversion needed
) else (
	echo No conversion needed
)

if /i %size%==_(
	echo Specify size
	exit /b
)
if /i %size%<32(
	echo Resolution must be 32x32 up to 1024x1024
	exit /b
)
if /i %size%>1024(
	echo Resolution must be 32x32 up to 1024x1024
	exit /b
)

set gray=gray_%1

magick convert %1 -grayscale Rec709Luminance %gray%

magick %gray% -resize "%size%x%size%" -gravity center -extent %size%x%size% reduced_%1.png

rem colors
magick convert reduced_%1.png ( -clone 0 -fill red  -colorize 50 ) -compose multiply -composite red_%1
magick convert reduced_%1.png ( -clone 0 -fill orange  -colorize 50 ) -compose multiply -composite orange_%1
magick convert reduced_%1.png ( -clone 0 -fill yellow  -colorize 50 ) -compose multiply -composite yellow_%1
magick convert reduced_%1.png ( -clone 0 -fill green  -colorize 50 ) -compose multiply -composite green_%1
magick convert reduced_%1.png ( -clone 0 -fill blue  -colorize 50 ) -compose multiply -composite blue_%1
magick convert reduced_%1.png ( -clone 0 -fill purple  -colorize 50 ) -compose multiply -composite purple_%1

rem delete the gray image
del /q reduced_%1.png
del /q %gray%

echo Rainbow and resize complete
