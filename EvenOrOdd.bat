@echo off
IF /I %1==a set a=%2
IF /I %1==b set b=%2

IF /I %3==a set a=%4
IF /I %3==b set b=%4

If /I %5==e set e=%6
IF /I %5==o set o=%6

If /I %7==e set e=%8
IF /I %7==o set o=%8

IF /I %1==e set e=%2
IF /I %1==o set o=%2

IF /I %3==e set e=%4
IF /I %3==o set o=%4

If /I %5==a set a=%6
IF /I %5==b set b=%6

If /I %7==a set a=%8
IF /I %7==b set b=%8

set /a "num=(a+b)%%2"

IF %num%==0 echo %e%
IF %num%==1 echo %o%
