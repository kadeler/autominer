#SingleInstance Force

Menu, Tray, Icon, automining.ico
Gui Show, w620 h420, Autominer v1.2
gui, destroy

statustext:="Скрипт выключен"
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

if !FileExist("config.ini"){
    Gui, Add, DropDownList, R10 Vtool1 gFirstCheck x350 y9 w130 h20 , Посох силы|Любая кирка
    Gui, Add, DropDownList, R10 Vtool2 gSecondCheck x350 y39 w130 h20 , Ваджра|Любая лопата
    Gui, Add, DropDownList, R10 Vtool3 gSubmitDDL x350 y69 w130 h20 , Любой топор
    Gui, Add, DropDownList, R10 Vtool4 gSubmitDDL x350 y99 w130 h10 , Любой меч
    Gui, Add, DropDownList, R10 Vafk gThirdCheck x350 y129 w130 h10 , Открытое окно|Свернутое окно
    Gui, Add, DropDownList, R10 Vcoords gTut5 x350 y159 w130 h20 , Через F3|Через миникарту
    goto firstlaunchwrap
}
else {
    IniRead, tool1, config.ini, startoptions, tool1
    IniRead, tool2, config.ini, startoptions, tool2
    IniRead, tool3, config.ini, startoptions, tool3
    IniRead, tool4, config.ini, startoptions, tool4
    IniRead, afk, config.ini, startoptions, afk
    IniRead, coords, config.ini, startoptions, coords
    IniRead, showtutorials, config.ini, startoptions, showtutorials
    

    if (tool1="Посох силы"){
        Gui, Add, DropDownList, R10 Vtool1 gFirstCheck x350 y9 w130 h20 , %tool1%||Любая кирка
    }
    else if (tool1="Любая кирка"){
        Gui, Add, DropDownList, R10 Vtool1 gFirstCheck x350 y9 w130 h20 , %tool1%||Посох силы
    }
    else{
        Gui, Add, DropDownList, R10 Vtool1 gFirstCheck x350 y9 w130 h20 , Посох силы|Любая кирка
    }
    
    if (tool2="Ваджра"){
        Gui, Add, DropDownList, R10 Vtool2 gSecondCheck x350 y39 w130 h20 , %tool2%||Любая лопата
    }
    else if (tool2="Любая лопата"){
        Gui, Add, DropDownList, R10 Vtool2 gSecondCheck x350 y39 w130 h20 , %tool2%||Ваджра
    }
    else {
        Gui, Add, DropDownList, R10 Vtool2 gSecondCheck x350 y39 w130 h20 , Ваджра|Любая лопата
    }
    
    if (tool3="Любой топор"){
        Gui, Add, DropDownList, R10 Vtool3 gSubmitDDL x350 y69 w130 h20 , %tool3%||
    }
    else {
        Gui, Add, DropDownList, R10 Vtool3 gSubmitDDL x350 y69 w130 h20 , %tool3%||Любой топор
    }
    
    if (tool4="Любой меч"){
        Gui, Add, DropDownList, R10 Vtool4 gSubmitDDL x350 y99 w130 h10 , %tool4%||
    }
    else {
        Gui, Add, DropDownList, R10 Vtool4 gSubmitDDL x350 y99 w130 h10 , %tool4%||Любой меч
    }

    if (afk="Открытое окно"){
        Gui, Add, DropDownList, R10 Vafk gThirdCheck x350 y129 w130 h10 , %afk%||Свернутое окно
    }
    else if (afk="Свернутое окно"){
        Gui, Add, DropDownList, R10 Vafk gThirdCheck x350 y129 w130 h10 , %afk%||Открытое окно
    }
    else {
        Gui, Add, DropDownList, R10 Vafk gThirdCheck x350 y129 w130 h10 , Открытое окно|Свернутое окно
    }
    
    if (coords="Через F3"){
        Gui, Add, DropDownList, R10 Vcoords gTut5 x350 y159 w130 h20 , %coords%||Через миникарту
    }
    else if (coords="Через миникарту"){
        Gui, Add, DropDownList, R10 Vcoords gTut5 x350 y159 w130 h20 , %coords%||Через F3
    }
    else{
        Gui, Add, DropDownList, R10 Vcoords gTut5 x350 y159 w130 h20 , Через F3|Через миникарту
    }
    
    if (tool1 = "Посох силы"){
        GuiControl, Disable , tool2
        GuiControl, Disable , tool3
        GuiControl, Disable , tool4
    }
    if (tool2 = "Ваджра"){
        GuiControl, Disable , tool3
        GuiControl, Disable , tool4
    }
    if (afk = "Свернутое окно"){
        GuiControl, Disable , coords
    }
    
    goto main
}





main:


Gui, Add, Text, x12 y13 w320 h20 , Выберите инструмент для копания камня/булыжника(слот 1):
Gui, Add, Text, x12 y43 w320 h20 , Выберите инструмент для копания земли/гравия(слот 2):
Gui, Add, Text, x12 y73 w320 h20 , Выберите инструмент для копания досок/заборов(слот 3):
Gui, Add, Text, x12 y103 w320 h20 , Выберите инструмент для копания паутины(слот 4):
Gui, Add, Text, x12 y133 w320 h20 , Выберите метод афк:
Gui, Add, Text, x12 y163 w320 h20 , Выберите метод определения координат:


Gui, Add, Picture, x500 y45 w100 h100 gDiscord, discord.png

Gui, Add, Edit, x12 y200 w597 h190 ReadOnly vlogger, 
(
Небольшой гайд перед использованием:
1) Открываем майн НЕ в полноэкранном режиме, а просто в развернутом окне (Win+↑)
2) Для работы скрипта рекомендуется хотя бы пб грудак: выкопайте перед собой дырку 2х2х1 и упритесь в ней головой в потолок
Так-же рекомендую использовать пб ботинки, так как они дают ускорение копания(ну или можете использовать дк грудак, у него нет штрафа на копание в полете ( ͡° ͜ʖ ͡°) )
3) Нажимаем F10 чтобы включить скрипт
4) В зависимости от выбранного вами режима окно либо должно остаться открытым, либо его его можно свернуть (Alt+Tab)
5) Наслаждаемся, нажимаем F12 чтобы отключить скрипт(сама программа не закрывается, поэтому можно снова нажать F10 для запуска скрипта)

Новости: к вам могут наведаться модеры, и задать вам какой-нибудь вопрос пока вы копаете, и если не отвечаете то получаете по лбу

Если хотите завершить программу полностью, чтобы можно было пользоваться F10 и F12, найдите в трее кирку → ПКМ по "Exit", или же просто закройте это окно

По любым вопросам нажимайте на иконку дискорда
)

Gui Add, StatusBar,vstatustext, Скрипт выключен
SB_SetParts(510,110)
SB_SetText("`t`tCreated by ka0313r", 2)

Menu, settings, Add, &Управление, openkeys
Menu, settings, Add  ;- Separator line.
Menu, settings, Add, &Выход, FileExit
Menu, MyMenuBar, Add, &Настройки, :settings
Menu, help, Add, &Показывать туториалы, TutorialRepeat
Menu, help, Add, &Обратная связь, Contacts
Menu, MyMenuBar, Add, &Помощь, :help
Gui, Menu, MyMenuBar

Gui Show, w620 h420, Autominer v1.2


return






F10::
    GuiControl,, statustext, Скрипт включен
    
    FileAppend, Запускаю автопилот`n, logs.txt
    FileAppend, Запускаю анализ препятствий`n, logs.txt
    FileAppend, Запускаю анализ координат`n, logs.txt
    
    if (afk="Открытое окно"){
        run opened.ahk
    }
    else if (afk="Свернутое окно"){
        run minimized.ahk
    }
    else {
        FileAppend, [Автопилот] Режим афк не выбран`, завершаю работу`n, logs.txt
    }
    
    run obstacle_analyze.ahk
    run coords.ahk
    SoundBeep, 500,100
    SoundBeep, 750,100
    
    pausepressed:=0
    while (pausepressed=0){
        FileRead, logs, logs.txt
        GuiControl,, logger, %logs%
        ControlSend,Edit1,^{END},Autominer v1.2
        sleep 3000
        if (pausepressed=1){
            break
        }
    }
return

F12::
    pausepressed:=1
    GuiControl,, statustext, Скрипт выключен
    
    SoundBeep, 750,100
    SoundBeep, 500,100
    
    FileAppend, Скрипт остановлен`n, logs.txt
    FileAppend, Логи очищены`n, logs.txt
    FileRead, logs, logs.txt
    GuiControl,, logger, %logs%
    ControlSend,Edit1,^{END},Autominer v1.2
    FileDelete, logs.txt
    
    WinActivate, Autominer v1.2
return

firstlaunchwrap:

FileAppend, 
(
/////////////////////////////////////////////////////
Конфиг сохраняет выбранные вами настройки в прошлый
раз чтобы не выбирать их повторно
Меняйте только если знаете что делаете
/////////////////////////////////////////////////////

), config.ini

msgbox, 48,,
(
//////////////////////////////!!!ВНИМАНИЕ!!!//////////////////////////////

Создатель скрипта не несет ответственными за потерянные вами вещи!
Оставаясь афк в копательном мире вы спокойно можете:

• Умереть от другого игрока
• Умереть от лавы
• Умереть от мобов
• Умереть от чего-угодно

Даже если вы думаете что у вас хорошая броня, 
отключен пвп, и вообще стоит антидроп - дважды 
подумайте прежде чем оставлять скрипт без присмотра

(Особенно с антидропом - известен баг что если на
экране смерти вас отключат изза рестарта - вещей
вы не получите. На крайний случай всегда делайте
скриншот инвентаря, и потом идите на форум)

//////////////////////////////////////////////////////////////////////////
)

showtutorials:="True"

goto main

Contacts:
msgbox,,Обратная связь,
(
Discord: kadeler#9057
Telegram: https://t.me/ka0313r
)
return

TutorialRepeat:
showtutorials:="True"
return

openkeys:
;Gui,2: Add, Text, x12 y13 w120 h20 , Слот 1:
;Gui,2: Add, Text, x12 y33 w120 h20 , Слот 2:
;Gui,2: Add, Text, x12 y53 w120 h20 , Слот 3:
;Gui,2: Add, Text, x12 y73 w120 h20 , Слот 4:
;Gui,2: Add, Text, x12 y93 w120 h20 , Старт:
;Gui,2: Add, Text, x12 y113 w120 h20 , Пауза:

;Gui,2: Add, Hotkey, Vtool1key x60 y10 w130 h20,
;Gui,2: Add, Hotkey, Vtool2key x60 y30 w130 h20,
;Gui,2: Add, Hotkey, Vtool3key x60 y50 w130 h20,
;Gui,2: Add, Hotkey, Vtool4key x60 y70 w130 h20,
;Gui,2: Add, Hotkey, Vstartkey x60 y90 w130 h20,
;Gui,2: Add, Hotkey, Vpausekey x60 y110 w130 h20,

;Gui,2: Add, Button, x142 y159 w80 h20 gSubmitkeys, Сохранить

;gui,2: show,h200 w300,Управление

Gui,2: Font, c228B22
Gui,2: Add, Text, x10 y10 w180 h20, В ближайшем обновлении
GuiControl, +comingsoon, Green
gui,2: show,h40 w200 ,Управление
return

GuiClose:
Fileexit:
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
    FileDelete, logs.txt
ExitApp

SubmitDDL:
    Gui, Submit, NoHide
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
return

;Submitkeys:
;    Gui, Submit
;    IniRead, %tool1key%, config.ini, startoptions, tool1key
;    IniRead, %tool2key%, config.ini, startoptions, tool1key
;    IniRead, %tool3key%, config.ini, startoptions, tool1key
;    IniRead, %tool4key%, config.ini, startoptions, tool1key
;return

Discord:
    Run https://discordapp.com/users/220219840466518016
return

FirstCheck:
    Gui, Submit, NoHide
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
    if (tool1 = "Посох силы"){
        GuiControl, Disable , tool2
        GuiControl, Disable , tool3
        GuiControl, Disable , tool4
    }
    else {
        if (tool2 = "Ваджра"){
            GuiControl, Enable , tool2
        }
        else {
            GuiControl, Enable , tool2
            GuiControl, Enable , tool3
            GuiControl, Enable , tool4 
        }
    }
    if (showtutorials="True"){
        goto Tut1
    }
return

SecondCheck:
    Gui, Submit, NoHide
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
    if (tool2 = "Ваджра"){
        GuiControl, Disable , tool3
        GuiControl, Disable , tool4
    }
    else {
        GuiControl, Enable , tool3
        GuiControl, Enable , tool4
    }
    if (showtutorials="True"){
        goto Tut2
    }
return

ThirdCheck:
    Gui, Submit, NoHide
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
    if (afk = "Свернутое окно"){
        GuiControl, Disable , coords
    }
    else {
        GuiControl, Enable , coords
    }
    if (showtutorials="True"){
        goto Tut3
    }

Tut1:
    if (showtutorials="False"){
        return
    }
    Gui,3: Add, Text, x8 y18 w402 h108 +Left, 
    (
    Как пользоваться автопилотом:

Cейчас вы выбрали первый инструмент, и когда вы выбираете посох, 
можете не париться по поводу выбора всех остальных инструментов 
так как все блоки будут ломаться посохом.

Также все инструменты нужно ложить в соответствующий слой(1 слот на единичку, и т.д.)
    )
    Gui,3: Add, Button, x472 y55 w80 h23 gCloseTut1, &OK
    Gui,3: Show, w620 h140, Туториал: 1/6
Return
CloseTut1:
    Gui,3: destroy
3GuiClose:
    Gui,3: destroy
return

Tut2:
    if (showtutorials="False"){
        return
    }
    Gui,4: Add, Text, x8 y18 w402 h108 +Left, 
    (
    Тут все почти также как с посохом:
Если выберете ваджру, можете не ставить что либо в 3 и 4 слот
так как ваджра ломает все блоки
Главное убедитесь что у вас есть лаппак, лазуротроновый кристалл
или хоть что нибудь что может заряжать этот инструмент, иначе
будете полчаса упираться в камень и пытаться сломать его рукой
(хотя автопилот должен перекинуть к камню, все равно время
уходит пока вы тупо тыкаетесь в стену)
    )
    Gui,4: Add, Button, x472 y55 w80 h23 gCloseTut2, &OK
    Gui,4: Show, w620 h140, Туториал: 2/6
Return
CloseTut2:
    Gui,4: destroy
4GuiClose:
    Gui,4: destroy
return

Tut3:
    if (showtutorials="False"){
        return
    }
    Gui,5: Add, Text, x8 y18 w402 h128 +Left, 
    (
    Как вы видели есть два метода афк: со свернутым окном, и с открытым.

• Метод с открытым окном подходит для тех у кого есть второй монитор
(пользоваться другим экраном все ещё нельзя, но можно подрубить
сериальчик, и время от времени посматривать не застрял ли где)

• Метод со свернутым окном позволяет свернуть майн, но не получится
определять координаты, поэтому вы можете застрять на границе мира.
Однако его нужно настроить.
    )
    Gui,5: Add, Button, x472 y65 w80 h23 gCloseTut3, &OK
    Gui,5: Show, w620 h160, Туториал: 3/6
Return
CloseTut3:
    Gui,5: destroy
    goto Tut4
5GuiClose:
    Gui,5: destroy
return

Tut4:
    if (showtutorials="False"){
        return
    }
    Gui,6: Add, Text, x8 y15 w402 h138 +Left,
    (
    Первым делом, зайдите на сервер, и нажмите Shift+"ё"
Откроется окно клавиш, и вам нужно нажать на клавишу
указанную ниже, и ввести команду рядом с ней, после чего
справа снизу нажать "Запись"(иначе не сохранится)
В настройках управления поставьте лкм на кнопку Delete
PAUSE: $${LOOK(0,45,0)}$$
SCRL: $${LOOK(-90,45,0)}$$
HOME: $${LOOK(-180,45,0)}$$
END: $${LOOK(-270,45,0)}$$
Команды скопируются после нажатия ОК
    )
    Gui,6: Add, Button, x472 y65 w80 h23 gCloseTut4, &OK
    Gui,6: Show, w620 h160, Туториал: 4/6
Return
CloseTut4:
    Gui,6: destroy
    Clipboard:="PAUSE: $${LOOK(0,45,0)}$$`nSCRL: $${LOOK(-90,45,0)}$$`nHOME: $${LOOK(-180,45,0)}$$`nEND: $${LOOK(-270,45,0)}$$"
6GuiClose:
    Gui,6: destroy
return

Tut5:
    Gui, Submit, NoHide
    IniWrite, %tool1%, config.ini, startoptions, tool1
    IniWrite, %tool2%, config.ini, startoptions, tool2
    IniWrite, %tool3%, config.ini, startoptions, tool3
    IniWrite, %tool4%, config.ini, startoptions, tool4  
    IniWrite, %afk%, config.ini, startoptions, afk
    IniWrite, %coords%, config.ini, startoptions, coords
    IniWrite, %showtutorials%, config.ini, startoptions, showtutorials
    if (showtutorials="False"){
        return
    }
    
    Gui,7: Add, Text, x8 y18 w402 h128 +Left,
    (
    Тут тоже два метода: Через F3 и Через миникарту

• Тут можно понять что достаточно будет просто нажать F3 и всё,
ничего настраивать не надо, однако качество определения коорд
через этот метод немного хромает, поэтому я бы посоветовал через
миникарту

• Метод с миникартой тоже требует небольшой настройки, и из минусов
я бы выделил просто не эстетический вид. Зато тут координаты намного
надежнее
    )
    Gui,7: Add, Button, x472 y65 w80 h23 gCloseTut5, &OK
    Gui,7: Show, w620 h160, Туториал: 5/6
Return
CloseTut5:
    Gui,7: destroy
    goto Tut6
7GuiClose:
    Gui,7: destroy
return

Tut6:
    if (showtutorials="False"){
        return
    }
    Gui,8: Add, Text, x8 y8 w402 h108 +Left,
    (
    Нажмите M, и найдите кнопку "Настройки"
Тут должен быть открыт раздел "Мини-карта - режим №1"

В разделе "Координаты" выберите режим "x, y, z"
ВАЖНО! Не "x, z, y(v)", не "x, y (v), z", а именно "x, y, z"
В ползунке "Размер шрифта" поставьте 2
Ну и на всякий случай поставьте круглую миникарту
(можно снова включить через Помощь → Показывать туториалы)
    )
    Gui,8: Add, Button, x472 y65 w80 h23 gCloseTut6, &OK
    Gui,8: Add, CheckBox, x8 y120 w210 h23 vCheckboxstatus gClickednotshow, Больше не показывать туториалы
    Gui,8: Show, w620 h160, Туториал: 6/6
Return
Clickednotshow:
    Gui, Submit, NoHide
    if (Checkboxstatus=1){
        showtutorials:="False"
    }
    else if (Checkboxstatus=0){
        showtutorials:="True"
    } 
return
CloseTut6:
    Gui,8: destroy
8GuiClose:
    Gui,8: destroy
return




;управление y координатой
;определение смерти
;скрипт на респавн и переподключение