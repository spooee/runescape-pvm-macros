#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape
#InstallKeybdHook


; CHECKS - for all of these you'll need to provide your coordinates and in some cases images to fit your own interface.

; is chat active? 0 means chat is not active, 1 means chat is active. this uses the wiki button in your chat box. use this for keys you usually type with, i.e numbers and letters without modifiers (CTRL, ALT, SHIFT).
; wouldn't want to type your telos p1 rotation macro in your clan chat now would you?
CHAT_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 486, 1014, 540, 1036, *40 *TransBlack D:\rs\wiki_button.png
        if (Errorlevel = 0) {
            return 0
        } else {
                return 1
        }
}

; are laceration boots equipped? 0 means yes, 1 means no. mainly used for shadow blobs at raksha as you want your scythe equipped. this uses the laceration boots icon in your equipment interface.
LACERATION_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1745, 896, 1776, 927, *40 *TransBlack D:\rs\lacerations.png
        if (Errorlevel = 0) {
            return 0
        } else {
                return 1
        }
}

; is a dungeoneering bladed dive switch equipped? 0 means yes, 1 means no. since dungeoneering weapons are not augmented they will unequip if you spam the macro. this will prevent that. i'm only checking if the
; mainhand weapon is equipped because lazy, and the macro equips them both anyway! you will need to provide your own images of your mainhand bladed dive switch in your equipment interface since there are a lot of 
; different ones!
DUNG_BD_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1877, 820, 1908, 851, *40 *TransBlack D:\rs\promethium_dagger.png
        if (ErrorLevel = 0) {
            return 0
        } else {
                return 1
        }
}

; are mech chins equipped? 0 means yes, 1 means no. since mech chins are not augmented they will unequip if you spam the macro or try to equip a different offhand with the dual wield macro. this check will make it 
; so the chins are not equipped again, leading to them actually becoming unequipped. this uses only the lower part of the chin icon since you always have a different amount of chins equipped. 
CHIN_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1877, 829, 1908, 851, *40 *TransBlack D:\rs\mech_chin.png
        if (Errorlevel = 0) {
            return 0
        } else {
                return 1
        }
}
; is excalibur equipped? 0 means yes, 1 means no. if excalibur is equipped, do not press the keybinds to equip mainhand + excalibur. these two weapons will still spam my chatbox even after Mod Pi's 
; stupid combat update. this uses the excalibur icon in your equipment interface.
EXCALIBUR_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1790, 858, 1820, 889, *40 *TransBlack D:\rs\excalibur.png
        if (Errorlevel = 0) {
            return 0
        } else {
                return 1
        }
}



; MACROS

; bladed dive
bladed_dive_keybind::
if (EXCALIBUR_check() = 0) {
    Send {bladed_dive_keybind down}
    Sleep 5
    Send {bladed_dive_keybind up}
} else 
    if (DUNG_BD_check() = 0) {
        Send {bladed_dive_keybind down}
        Sleep 5
        Send {bladed_dive_keybind up}
} else
    if (LACERATION_check() = 0) {
        Send {bladed_dive_keybind down}
        Sleep 5
        Send {bladed_dive_keybind up}
        } else
        if (CHAT_check() = 0) 
         {
           Send {bladed_dive_keybind down}
           Send {mainhand_keybind down}
           Send {offhand_keybind down}
           Sleep 5
           Send {bladed_dive_keybind up}
           Send {mainhand_keybind up}
           Send {offhand_keybind up}
             } else {
         Send {bladed_dive_keybind down} 
         Sleep 1
         Send {bladed_dive_keybind up}
     }  
return

; dual wield
dualwield_keybind::
    Send {mainhand_keybind down}
    Send {offhand_keybind down}
    Sleep 5
    Send {mainhand_keybind up}
    Send {offhand_keybind up}
return

; flank
flanking_keybind::
    Send {mainhand_keybind down}
    Send {flanking_keybind down}
    Sleep 5
    Send {mainhand_keybind up}
    Send {flanking_keybind up}
return

; caroming
caroming_keybind::
    if (CHAT_check() = 1) {
        Send {caroming_keybind down}
        Sleep 5
        Send {caroming_keybind up}
    } else {
        Send {mainhand_keybind down}
        Send {caroming_keybind down}
        Sleep 5
        Send {mainhand_keybind up}
        Send {caroming_keybind up}
    }
return

; mech chins
mech_chins_keybind::
if (CHAT_check() = 1) {
    Send {mech_chins_keybind down}
    Sleep 5
    Send {mech_chins_keybind up}
} else {
    if (CHIN_check() = 0) {
        Send {offhand_keybind down}
        Sleep 5
        Send {offhand_keybind up}
} else 
    Send {offhand_keybind down}
    Send {mech_chins_keybind down}
    Sleep 5
    Send {offhand_keybind up}
    Send {mech_chins_keybind up}
    }
return

; woot!