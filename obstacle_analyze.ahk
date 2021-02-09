#singleinstance force
#ifwinActive Minecraft 1.7.10
IniRead, tool1, config.ini, startoptions, tool1
IniRead, tool2, config.ini, startoptions, tool2
IniRead, tool3, config.ini, startoptions, tool3
IniRead, tool4, config.ini, startoptions, tool4
IniRead, afk, config.ini, startoptions, afk

keyfordirt:=0
keyfordungeon:=0
keyforcobweb:=0

if (afk="Свернутое окно"){
    FileAppend, [Анализ препятствий] Выбран режим свернутого окна`, завершаю работу`n, logs.txt
    ExitApp
}
else if (afk="Открытое окно"){
    CoordMode Pixel
    FileAppend, [Анализ препятствий] Выбран режим открытого окна`n, logs.txt

    if (tool1="Посох силы"){
        FileAppend, [Анализ препятствий] Инструмент 1: Посох`n, logs.txt
        FileAppend, [Анализ препятствий] Анализ препятствий не нужен`n, logs.txt
        FileAppend, [Анализ препятствий] Будет работать только клик ПКМ чтобы не застревать в блоках`n, logs.txt
        Loop{
            sleep 5000
            ControlClick x960 y540,Minecraft 1.7.10,,Right
        }
    }
    else if (tool2="Ваджра"){
        FileAppend, [Анализ препятствий] Инструмент 2: Ваджра`n, logs.txt
        FileAppend, [Анализ препятствий] Будет использоваться для земли`, досок и паутины`n, logs.txt
        keyfordirt:=2
        keyfordungeon:=2
        keyforcobweb:=2
    }
    else if (tool3="Любой топор"){
        keyfordirt:=2
        keyfordungeon:=3
        keyforcobweb:=4
    }
    else if (tool4="Любой меч"){
        keyfordirt:=2
        keyfordungeon:=3
        keyforcobweb:=4
    }
    else{
        FileAppend, [Анализ препятствий] Неопознанная ошибка в инструментах`, завершаю работу`n, logs.txt
        exitapp
    }

    Loop{
    PixelGetColor pos1, 900, 50, RGB    ;////
    PixelGetColor pos2, 913, 50, RGB    ;////
    PixelGetColor pos3, 900, 60, RGB    ;////
    PixelGetColor pos4, 913, 60, RGB    ;////
    PixelGetColor pos5, 890, 50, RGB    ;////
    PixelGetColor pos6, 903, 50, RGB    ;////
    PixelGetColor pos7, 890, 60, RGB    ;////
    PixelGetColor pos8, 904, 60, RGB    ;проверка waila
    PixelGetColor pos9, 872, 50, RGB    ;////
    PixelGetColor pos10, 885, 50, RGB   ;////
    PixelGetColor pos11, 872, 60, RGB   ;////
    PixelGetColor pos12, 885, 60, RGB   ;////
    PixelGetColor pos13, 900, 48, RGB   ;////
    PixelGetColor pos14, 916, 50, RGB   ;////
    PixelGetColor pos15, 901, 55, RGB   ;////
    PixelGetColor pos16, 901, 65, RGB   ;////

    PixelGetColor pos17, 876, 482       ;////
    PixelGetColor pos18, 1054, 482      ;////
    PixelGetColor pos19, 876, 573       ;////
    PixelGetColor pos20, 1054, 573      ;проверка застревания в гравии
    PixelGetColor pos21, 689, 482       ;////
    PixelGetColor pos22, 1229, 482      ;////
    PixelGetColor pos23, 689, 573       ;////
    PixelGetColor pos24, 1229, 573      ;////
    
    if (pos1=0x79553A && pos2=0x966C4A && pos3=0x76553B or pos3=0x75543A && pos4=0x271A12){
        FileAppend, [Анализ препятствий] Обнаружена земля`n, logs.txt
        ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
    }
    
    else if (pos1=0x5A5854 && pos2=0x595753 && pos3=0x525050 or pos3=0x525151 && pos4=0x323130 or pos4=0x313130){
        FileAppend, [Анализ препятствий] Обнаружен гравий`n, logs.txt
        ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
    }
    
    else if (pos1=0xDDD7A0 && pos2=0xD8D29A && pos3=0x86825E && pos4=0x605D46){
        FileAppend, [Анализ препятствий] Обнаружен песок`n, logs.txt
        ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
    }
    
    else if (pos9=0xAA5920 && pos10=0xA75920 && pos11=0x693514 && pos12=0x4A270F){
        FileAppend, [Анализ препятствий] Обнаружен красный песок`n, logs.txt
        ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
    }
    
    else if (pos5=0x619454 && pos6=0x5A894E && pos7=0x76553B && pos8=0x271A12){
        FileAppend, [Анализ препятствий] Обнаружена трава`n, logs.txt
        ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
    }
    
    else if (pos9=0x735E39 && pos10=0x735E39 && pos11=0x655431 && pos12=0x52422B){
        FileAppend, [Анализ препятствий] Обнаружен доска`n, logs.txt
        ControlSend, , {%keyfordungeon% down}{%keyfordungeon% up},Minecraft 1.7.10
    }
    
    else if (pos13=0xDDDDDD && pos14=0xEDEDED && pos3=0xDDDDDD && pos4=0xCECECE){
        FileAppend, [Анализ препятствий] Обнаружена паутина`n, logs.txt
        ControlSend, , {%keyforcobweb% down}{%keyforcobweb% up},Minecraft 1.7.10
    }
    
    else if (pos15=0xBC9862 && pos2=0x52422B && pos16=0x4E3F27 && pos4=0x52422B){
        FileAppend, [Анализ препятствий] Обнаружен забор`n, logs.txt
        ControlSend, , {%keyfordungeon% down}{%keyfordungeon% up},Minecraft 1.7.10
    }
    
    else if (pos17=0x121212 && pos18=0x121212 && pos19=0x080909 && pos20=0x0A0B0B){
        if (pos21=0x09090A && pos22=0x0D0D0D && pos23=0x070808 && pos24=0x0E0E0E){
            FileAppend, [Анализ препятствий] Игрок застрял в гравии`n, logs.txt
            ControlSend, , {1 up},Minecraft 1.7.10
            ControlSend, , {%keyfordirt% down}{%keyfordirt% up},Minecraft 1.7.10
        }
    }
    
    else{
        FileAppend, [Анализ препятствий] Препятствий не обнаружено`n, logs.txt
        ControlSend, , {1},Minecraft 1.7.10
        ControlClick x960 y540,Minecraft 1.7.10,,Right
    }
}
}
else{
    FileAppend, [Анализ препятствий] Режим афк не выбран`, завершаю работу`n, logs.txt
    ExitApp
}

~F12::
FileAppend, [Анализ препятствий] Нажата F12`, завершаю работу`n, logs.txt
exitapp