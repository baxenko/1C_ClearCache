@echo off
chcp 1251 >nul
color 3
echo Завершую 1С у всiх користувачiв... 
taskkill /IM 1cv8c.exe /F /T
echo Всi вiдкритi 1C спiшно завершенi :-)
echo Починаю видаляти кеш 1С...
timeout /t 3 /nobreak >nul
setlocal enabledelayedexpansion
set AllUsersProfile=%SystemDrive%\Users

for /D %%A in ("%AllUsersProfile%\*") do (
    if not "%%~nxA"=="Public" (
        echo Cleaning 1Cv8 folders for user: %%~nxA
        
        set "RoamingFolderToDelete=%%A\AppData\Roaming\1C\1Cv8"
        if exist "!RoamingFolderToDelete!" (
            echo Cleaning !RoamingFolderToDelete!...
            del /F /S /Q "!RoamingFolderToDelete!\*"
            rmdir /S /Q "!RoamingFolderToDelete!"
        ) else (
            echo Folder not found: !RoamingFolderToDelete!
        )
        
        set "LocalFolderToDelete=%%A\AppData\Local\1C\1Cv8"
        if exist "!LocalFolderToDelete!" (
            echo Cleaning !LocalFolderToDelete!...
            del /F /S /Q "!LocalFolderToDelete!\*"
            rmdir /S /Q "!LocalFolderToDelete!"
        ) else (
            echo Folder not found: !LocalFolderToDelete!
        )
    )
)
echo                                        ```.......```                                               
echo                                  `.-/++oosssssssssoo+/:-.`                .-://+/:-.`              
echo                              `.:+ossssssssssssssssssssssso+:.          ./oyyyyyyyyyys/.            
echo                            ./osssssssssssssssssssssssssssssss/`      `/yyyyyyyyyyyyyyyy+`          
echo                         `:+sssssssssssssssssssssssssssssssssss+     `oyyyyyyyyyyyyyyyyyyo`         
echo                       `:ossssssssssssssssssssssssssssssssssssss.    /yyyyyyyyyyyyyyyyyyyy+         
echo                      .ossssssssssssssssssssssssssssssssssssssss`   `syyyyyyyyyyyyyyyyyyyyy`        
echo                    `:sssssssssssssssssssssssssssssssssssssssss:    -yyyyyyyyyyyyyyyyyyyyyy`        
echo                   `+ssssssssssssssssssso+:--...--:+ossssssss+-    `syyyyyyyyyyyyyyyyyyyyyo         
echo                  `+sssssssssssssssss+-`             .-://:-`     -syyyyyyyyyyyyyyyyyyyyys.         
echo                  +ssssssssssssssss:`     `.:::::.`            `-+yyyyyyyyyyyyyyyyyyyyyyo.          
echo                 -sssssssssssssss+`    ./syyyyyyyyys/-.`````-:+ss+/:::::+oyyyyyyyyyyyy+-            
echo                `ossssssssssssss/    .+yyyyyyyyyyyyyyyyyyyyyys:.          `.:/+oo++:-`              
echo                -ssssssssssssss+    -yyyyyyyyyyyyyyyyyyyyyys-      `..``                            
echo                +ssssssssssssss.   `yyyyyyyyyyyyyyyyyyyyyys`    -+ossssso:`                         
echo                ossssssssssssso    /yyyyyyyyyyyyyyyyyyyyyy`   `+sssssssssss:                        
echo                ossssssssssssso    /yyyyyyyyyyyyyyyyyyyyy+    +sssssssssssss-                       
echo                +ssssssssssssss`   .yyyyyyyyyyyyyyyyyyyyy-   .ssssssssssssss/                       
echo                :ssssssssssssss:    +yyyyyyyyyyyyyyyyyyy+    /ssssssssssssss-                       
echo                .sssssssssssssss.    /yyyyyyyyyyyyyyyyy/    -sssssssssssssss`                       
echo                 /sssssssssssssss-    ./syyyyyyyyyyys/.    :sssssssssssssss:                        
echo                 `osssssssssssssss/.    `.:+ooooo+:.`    .+ssssssssssssssso`                        
echo                  .sssssssssssssssss/.`               `-+sssssssssssssssso.                         
echo                   -sssssssssssssssssso/:.``     ``.:+ossssssssssssssssso.                          
echo                    .osssssssssssssssssssssooooooossssssssssssssssssssso.                           
echo                     `/sssssssssssssssssssssssssssssssssssssssssssssss/`                            
echo                       -osssssssssssssssssssssssssssssssssssssssssss+.                              
echo                       `-+sssssssssssssssssssssssssssssssssssssss+-                                
echo                         `./ossssssssssssssssssssssssssssssssso/.                                  
echo                             `-/ossssssssssssssssssssssssssso/-`                                    
echo                                `.-/oossssssssssssssssso+/-.`                                       
echo                                      ..-::///////::-..` 
echo Кеш успiшно видален. Гарного дня :-)
pause


