@echo off
echo "Attempting to build rbx-boost..."

if not exist ./b2.exe (
	echo "[PRE-BUILD | ERR] [101mYou have not run[0m [1m[96m./bootstrap.bat!"
	echo "					[101mPlease run it before trying to build boost![0m"
	pause
	exit
)

set /p zlibSrc=Please enter the location to your zlib source code (Drag and drop here, press [ENTER] to skip, example: PROJECT_SRC/Contribs/ZLIB_SRC) ) :

if defined zlibSrc (
	set /p zlibBinary=Please enter the location to your zlib binary/build (Drag and drop here, example: ZLIB_SRC/lib/release) :
)

b2 stage ^
 -a ^
 --reconfigure ^
 --toolset=msvc ^
 --variant=release ^
 -s ZLIB_SOURCE=%zlibSrc% ^
 -s ZLIB_BINARY=%zlibBinary% ^
 --prefix=. ^
 --libdir=./lib ^
 --includedir=./include


echo "Built boost succesfully!"

pause
exit
