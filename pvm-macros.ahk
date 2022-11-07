#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape
#InstallKeybdHook

; very messy, probably some way to group together common checks for, for example chins and keris instead of doing two separate checks, but i'm too lazy to figure it out.


; COORDINATES
; saving the coordinates for different things in my interface for easier access. these coordinates will of course not work unless you have exactly the same interface layout as me.

; Main-hand
; 1877, 820, 1908, 851

; Off-hand
; 1790, 858, 1820, 889

; Wiki button
; 484, 1012, 540, 1036

; Boots
; 1745, 896, 1776, 927

; Ring
; 1789, 896, 1820, 927


; PROFILES

profile := 0

display_current_profile()
{

    if (global profile= 0)
        MsgBox, 0, , You're doing the usual stuff retard, 1.2

    if (global profile= 1)
        MsgBox, 0, , Wow you're doing Shattered worlds congrats!, 1.2

    if (global profile= 2)
        MsgBox, 0, , This does nothing retard, 1.2

    Return
}


; GLOBAL
F9:: 
    global profile := 0
    display_current_profile()
Return

; shattered worlds - only need this because i use mech chins at sw and since they're not augmented it fucks with the bd macro. 
F10:: 
    global profile := 1
    display_current_profile()
Return

; profile x - not used
F11::
    global profile := 2
    display_current_profile()
Return

global skip_check :=0




; LETTERS -  since i'm a swetard i need swedish keys :-) what these checks allow me to do is type with swedish letters when chat is active and still use them as macro keybinds. 
; uses the wiki button in your chat to check if you're trying to type in chat.

; SC01A::   the swedish letter å   in runescape this looks like ]
; i have this key as a macro for caroming so the chat check is down there

SC028:: ;   the swedish letter ä   in runescape this looks like #
if (CHAT_check() = 1) {
        Send {SC028 down}
        Sleep 5
        Send {SC028 up}
    }
    return

; SC027:: ;   the swedish letter ö   in runescape this looks like :
; i have this key as a macro for mech chins so the chat check is down there



; CHECKS - for all of these you'll need to provide your coordinates and in some cases images to fit your own interface. don't forget to fix the coordinates if you move your interface around so you're not stuck
; in a pvm hour without being able to weapon switch properly :-)



; equip dual wield or offhand only? 0 means both needs equipping, 1 means offhand only. this uses the empty offhand icon. just to get rid of the spammy "Check" messages. 
; this isn't really needed after the March 29th Mod Pi combat patch where he fixed the "Check" message spam, but it's fun to keep here anyway to look back on :-) this macro used to cause problems when pressing your 
; dual wield button too early when weapon switching and you'd only equip your off-hand and start running md, so very happy he fixed this for us :-)
OH_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1790, 858, 1820, 889, *40 *TransBlack D:\rs\empty_offhand.png
        if (ErrorLevel = 0 || global skip_check = 1) {
            return 0
        } else {
                return 1
        }
}

; is chat active? 0 means chat is not active, 1 means chat is active. this uses the wiki button in your chat box. use this for keys you usually type with, i.e numbers and letters without modifiers (CTRL, ALT, SHIFT).
; wouldn't want to type your telos p1 rotation macro in your clan chat now would you?
CHAT_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 486, 1014, 540, 1036, *40 *TransBlack D:\rs\wiki_button.png
        if (Errorlevel = 0 || global skip_check = 1) {
            return 0
        } else {
                return 1
        }
}

; are laceration boots equipped? 0 means yes, 1 means no. mainly used for shadow blobs at raksha as you want your scythe equipped. this uses the laceration boots icon in your equipment interface.
LACERATION_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1745, 896, 1776, 927, *40 *TransBlack D:\rs\lacerations.png
        if (Errorlevel = 0 || global skip_check = 1) {
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
        if (ErrorLevel = 0 || global skip_check = 1) {
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
        if (Errorlevel = 0 || global skip_check = 1) {
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
        if (Errorlevel = 0 || global skip_check = 1) {
            return 0
        } else {
                return 1
        }
}


; Is ring of vigour equipped? 0 means yes, 1 means no. if ring of vigour is equipped, do not press the keybind to equip it again, since that will just unequip it. this uses the ring of vigour
; icon in your equipment interface.
VIGOUR_check() {
        CoordMode, Pixel, Screen
        ImageSearch, , , 1789, 896, 1820, 927, *40 *TransBlack D:\rs\vigour.png
        if (Errorlevel = 0 || global skip_check = 1) {
            return 0
        } else {
                return 1
        }
}



; MACROS

; bladed dive
x::
if (EXCALIBUR_check() = 0) {
    Send {x down}
    Sleep 5
    Send {x up}
} else 
    if (DUNG_BD_check() = 0) {
        Send {x down}
        Sleep 5
        Send {x up}
} else
    if (LACERATION_check() = 0) {
        Send {x down}
        Sleep 5
        Send {x up}
        } else
        if (CHAT_check() = 0) 
         {
           Send {x down}
           Send {PgUp down}
           Send {PgDn down}
           Sleep 5
           Send {x up}
           Send {PgUp up}
           Send {PgDn up}
             } else {
         Send {x down} 
         Sleep 1
         Send {x up}
     }  
return

; dual wield
XButton1::
    Send {NumpadDiv down}
    Send {NumpadMult down}
    Sleep 5
    Send {NumpadDiv up}
    Send {NumpadMult up}
return

; flank
XButton2::
    Send {NumpadDiv down}
    Send {. down}
    Sleep 5
    Send {NumpadDiv up}
    Send {. up}
return

; caroming
SC01A::
    if (CHAT_check() = 1) {
        Send {SC01A down}
        Sleep 5
        Send {SC01A up}
    } else {
        Send {NumpadDiv down}
        Send {SC01A down}
        Sleep 5
        Send {NumpadDiv up}
        Send {SC01A up}
    }
return

; mech chins
9::
if (CHAT_check() = 1) {
    Send {9 down}
    Sleep 5
    Send {9 up}
} else {
    if (CHIN_check() = 0) {
        Send {NumpadMult down}
        Sleep 5
        Send {NumpadMult up}
} else 
    Send {NumpadMult down}
    Send {9 down}
    Sleep 5
    Send {NumpadMult up}
    Send {9 up}
    }
return


; ring of vigour for sunshine (+ planted feet switch) (not needed since Extinction quest)
;z::
if (CHAT_check() = 1) {
    Send {z down}
    Sleep 5
    Send {z up}
} else
    if (VIGOUR_check() = 0) {
        Send {F6 down}
        Send {NumpadDiv down}
        Sleep 50
        Send {z down}
        Sleep 5
        Send {z up}
        Send {F6 up}
        Send {NumpadDiv up}
        Sleep 400
        Send {NumpadSub down}
        Sleep 5
        Send {NumpadSub up}
        Sleep 600
        SendInput k
     } else
        if (VIGOUR_check() = 1) {
        Send {j down}
        Send {F6 down}
        Send {NumpadDiv down}
        Sleep 50
        Send {z down}
        Sleep 5
        Send {j up}
        Send {z up}
        Send {F6 up}
        Send {NumpadDiv up}
        Sleep 400
        Send {NumpadSub down}
        Sleep 5
        Send {NumpadSub up}
        Sleep 600
        Send {k down}
        Sleep 5
        Send {k up}
     }
return

; ring of vigour for omnipower (not needed since Extinction quest)
;i::
if (CHAT_check() = 1) {
    Send {i down}
    Sleep 5
    Send {i up}
} else
    if (VIGOUR_check() = 0) {
        Send {i down}
        Sleep 5
        Send {i up}
        Sleep 1000
        SendInput k
     } else
        if (VIGOUR_check() = 1) {
        Send {j down}
        Sleep 50
        Send {i down}
        Sleep 5
        Send {j up}
        Send {i up}
        Sleep 1000
        Send {k down}
        Sleep 5
        Send {k up}
     }
return

; ring of vigour for tsunami (not needed since Extinction quest)
;o::
if (CHAT_check() = 1) {
    Send {o down}
    Sleep 5
    Send {o up}
} else
    if (VIGOUR_check() = 0) {
        Send {o down}
        Sleep 5
        Send {o up}
        Sleep 1000
        SendInput k
     } else
        if (VIGOUR_check() = 1) {
        Send {j down}
        Sleep 50
        Send {o down}
        Sleep 5
        Send {j up}
        Send {o up}
        Sleep 1000
        Send {k down}
        Sleep 5
        Send {k up}
     }
return


; ring of vigour for special attacks (eof) (not needed since Extinction quest)
;,::
if (CHAT_check() = 1) {
    Send {, down}
    Sleep 5
    Send {, up}
} else
    if (VIGOUR_check() = 0) {
        Send {, down}
        Sleep 5
        Send {, up}
        Sleep 1000
        SendInput k
     } else
        if (VIGOUR_check() = 1) {
        Send {j down}
        Sleep 50
        Send {, down}
        Sleep 5
        Send {j up}
        Send {, up}
        Sleep 1000
        Send {k down}
        Sleep 5
        Send {k up}
     }
return


; woot!