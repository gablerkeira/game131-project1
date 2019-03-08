@echo off

set o=%1
set x=%~2
set y=%~3

if /i %~1==help (
	echo To Use: 
	echo Borders.bat name of file.jpg width of border height of border
	echo Turns an image rainbow, then resizes the rainbow images
	exit /b
)

if _%o%==_ (
	echo Filename missing
	exit/b
)
if _%x%==_ (
	echo Width was not provided
	exit/b
)
if _%y%==_ (
	echo Height was not provided
	exit /b
)

set w=border_%o%

magick %o% %w%

magick %w% -draw "rectangle 0,0 %x%,%y%" %w%
magick %w% -draw "rectangle 0,0 %y%,%x%" %w%

magick %w% -flip %w%
magick %w% -draw "rectangle 0,0 %x%,%y%" %w%
magick %w% -draw "rectangle 0,0 %y%,%x%" %w%

magick %w% -flop %w%
magick %w% -draw "rectangle 0,0 %x%,%y%" %w%
magick %w% -draw "rectangle 0,0 %y%,%x%" %w%

magick %w% -flip %w%
magick %w% -draw "rectangle 0,0 %x%,%y%" %w%
magick %w% -draw "rectangle 0,0 %y%,%x%" %w%

magick %w% -flop %w%

rem magick %w% %o%

echo Finished adding corner borders