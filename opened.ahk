#singleinstance force

FileAppend, [Автопилот] Выбран режим с открытым окном`n, logs.txt
SetTitleMatchMode, 2
ControlClick x960 y540,Minecraft 1.7.10,,LEFT,,D
ControlSend, , {w down},Minecraft 1.7.10

loop{
	Random, randoption, 1, 100
	SetTitleMatchMode, 2
	SetControlDelay -1
        
	sleep 60000
	if (randoption=5){
		FileAppend, [Автопилот] Поворачиваю направо`n , logs.txt
		sleep 50
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
	} else if (randoption=10){
		FileAppend, [Автопилот] Поворачиваю налево`n , logs.txt
		sleep 50
		x := -600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
	} else if (randoption=15){
		FileAppend, [Автопилот] Поворачиваю назад`, затем направо`n , logs.txt
		sleep 50
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 3000
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
	} else if (randoption=20){
		FileAppend, [Автопилот] Поворачиваю назад`, затем налево`n , logs.txt
		sleep 50                                                        
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
		x := 600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 3000
		x := -600, y := 0
		DllCall("mouse_event",uint, 1, int, x, int, y, uint, 0, int, 0)
		sleep 50
	} else {
		FileAppend, [Автопилот] Решено никуда не поворачивать`n, logs.txt
	}
}

~F12::
FileAppend, [Автопилот] Нажата F12`, завершаю работу`n, logs.txt
ControlClick x960 y540,Minecraft 1.7.10,,LEFT
ControlSend, , {w up},Minecraft 1.7.10
exitapp