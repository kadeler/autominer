#singleinstance force

IniRead, afk, config.ini, startoptions, afk
IniRead, coords, config.ini, startoptions, coords

if (afk="Свернутое окно"){
    FileAppend, [Анализ координат] Выбран режим свернутого окна`, завершаю работу`n, logs.txt
    exitapp
}
else if (afk="Открытое окно"){
    FileAppend, [Анализ координат] Выбран режим открытого окна`n, logs.txt
    if (coords="Через F3"){
        FileAppend, [Анализ координат] Выбран режим поиска через F3`n, logs.txt
		SetTitleMatchMode, 2
        DllCall("AllocConsole")
		hConsole := DllCall("GetConsoleWindow")
		WinWait % "ahk_id " hConsole
		WinHide 
        loop{
    
            xstr= % ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c cd ocr & Capture2Text_CLI.exe -s ""20 142 150 164"" --scale-factor 10.0 --whitelist "",-0123456789""").StdOut.ReadAll()

            ystr= % ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c cd ocr & Capture2Text_CLI.exe -s ""20 162 90 182"" --scale-factor 10.0 --whitelist "",-0123456789""").StdOut.ReadAll()

            zstr= % ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c cd ocr & Capture2Text_CLI.exe -s ""20 184 150 206"" --scale-factor 10.0 --whitelist "",-0123456789""").StdOut.ReadAll()

            FileAppend, [Анализ координат] Беру координаты`n, logs.txt

            StringReplace, x, xstr, `,, `.
            StringReplace, y, ystr, `,, `.
            StringReplace, z, zstr, `,, `.
            StringReplace, x, xstr, %A_Space%
            StringReplace, y, ystr, %A_Space%
            StringReplace, z, zstr, %A_Space%

	    ControlClick x960 y540,Minecraft 1.7.10,,LEFT,,D

            if (x>5000 OR x<-5000) {
            x:=x/100000
            }
            if (y>1000) {
            y:=y/1000
            }
            if (z>5000 OR z<-5000) {
            z:=z/100000
            }

            FileAppend, [Анализ координат] Анализ...`n, logs.txt

			xq:=Mod(x, Round(x,0))
            if (xq < 0.25){
                ControlSend, , {d down}{d up},Minecraft 1.7.10
            } 
            else if (xq > 0.75) {
                ControlSend, , {a down}{a up},Minecraft 1.7.10
            }

            zq:=Mod(z, Round(z,0))
            if (zq < 0.25){
                ControlSend, , {d down}{d up},Minecraft 1.7.10
            } 
            else if (zq > 0.75) {
                ControlSend, , {a down}{a up},Minecraft 1.7.10
            }

        }
    }
    else if (coords="Через миникарту"){
        FileAppend, [Анализ координат] Выбран режим поиска через миникарту`n, logs.txt
        SetTitleMatchMode, 2
        DllCall("AllocConsole")
		hConsole := DllCall("GetConsoleWindow")
		WinWait % "ahk_id " hConsole
		WinHide 
        Loop{
            posstr= % ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c cd ocr & Capture2Text_CLI.exe -s ""1646 349 1869 376"" --scale-factor 10.0 --whitelist "",-0123456789xyz:""").StdOut.ReadAll()
            
            FileAppend, [Анализ координат] Беру координаты`n, logs.txt
            
            Arr := StrSplit(posstr,[A_Space,"x: ",", y: ",", z: "])
            x:=Arr[2]
            y:=Arr[3]
            z:=Arr[4]
	    x:=x*10/10
	    y:=y*10/10
	    z:=z*10/10

	    ControlClick x960 y540,Minecraft 1.7.10,,LEFT,,D

            FileAppend, [Анализ координат] Анализ...`n, logs.txt

			if (x="" or z=""){
				FileAppend, [Анализ координат] Координаты не опознаны`n, logs.txt
			}
            else if (x>2800 OR x<-2800 OR z>2800 OR z<-2800){
                FileAppend, [Анализ координат] x или z больше 2800`, поворачиваю`n, logs.txt
                x := 600, y := 0                                                ;////
                DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0) ;////
                sleep 1000                                                      ;////                                                        
                x := 600, y := 0                                                ;поворот на право и назад
                DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0) ;////
                sleep 50                                                        ;////
                x := 600, y := 0                                                ;////
                DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0) ;////
                sleep 50
            }
            else {
                FileAppend, [Анализ координат] x или z не превышает 2800`n, logs.txt
            }
			
			Random, randoption, 1, 100
			if (randoption<25){
				ControlSend, , {d down}{d up},Minecraft 1.7.10
			}
			else if (randoption>75){
				ControlSend, , {a down}{a up},Minecraft 1.7.10
			}
			else{
				randoption:=randoption
			}
			
            Sleep 1000
        }
    }
    else {
        FileAppend, [Анализ координат] Режим поиска координат не выбран`, завершаю работу`n, logs.txt
        exitapp
    }  
}
else {
    FileAppend, [Анализ координат] Режим афк не выбран`, завершаю работу`n, logs.txt
    exitapp
}

~F12::
FileAppend, [Анализ координат] Нажата F12`, завершаю работу`n, logs.txt
DllCall("FreeConsole")
exitapp