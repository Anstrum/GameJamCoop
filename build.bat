rem this file create a .love file in the build folder

rem delete build filder is exist
if exist build rmdir /s /q build

rem create build folder
mkdir build

rem create the game.love file using 7zip
7z a -tzip build\game.love project\* main.lua

