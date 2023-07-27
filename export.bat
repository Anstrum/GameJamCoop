rem this file create a .love file in the build folder

rem delete build filder is exist
if exist build rmdir /s /q build

rem create build folder
mkdir build

rem create the game.love file using 7zip
7z a -tzip build\game.love project\* main.lua

rem create game.exe based on game.love and love2D/love.exe
copy /b love2D\love.exe+build\game.love build\game.exe

rem remove game.love
del build\game.love

rem copy the dlls and license.txt to the build folder 
copy love2D\*.dll build
copy love2D\license.txt build

rem add every files of the build folder to an archive named game.zip
7z a -tzip build\game.zip build\*