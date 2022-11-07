# runescape-pvm-macros
My personal PvM macros for Runescape 3. Just a BUNCH of else if, Send, and Sleep statements thrown in with some checks with AutoHotKey's CoordMode and ImageSearch commands.
This includes macros for: 
* Bladed dive - Equips your bladed dive switches if they're not already equipped and presses bladed dive, otherwise acts as pressing bladed dive normally. Respects when you have a dungeoneering weapon equipped, making you not unequip it. It also respects when you have laceration boots equipped, making the macro only send the bladed dive key. This may be useful for bladed diving shadow blobs at Raksha or other places you'd rather bladed dive with a 2h.

* Equipping dual wield - Very simple, just presses two keybinds for you.

* Equipping flanking and caroming switches - Very simple, just presses two keybinds for you.

* Equipping mechanical chins - Has a check to make sure it works smoothly. If chins are already equipped, it will only send the key to equip your offhand. If chins are not equipped, it will send keys to equip both your chins and your offhand.


<h1> How check works, yes? </h1>
All my checks work by reading your screen via AutoHotKey's CoordMode and ImageSearch commands and comparing it to images you provide. 
For example, my excalibur check used for the bladed dive macro:

![image](https://user-images.githubusercontent.com/32413258/200340773-971eeed4-436c-497a-98aa-f8813c185f80.png)

The macro checks for this ![excalibur](https://user-images.githubusercontent.com/32413258/200333256-9ac5a046-b963-4051-b958-2ec422b21b20.png) exact image (excalibur equipped) at the specified location on your screen. If the macro finds that the excalibur is equipped, it'll run the code to ONLY activate the bladed dive keybind, since you're more than likely already equipped with your melee mainhand if you have the excalibur equipped.
If the macro however finds that the excalibur is not equipped, it more than likely means that you need both your mainhand and offhand equipped, so it sends the keys to equip them both, and also activates the bladed dive keybind.


<h1> Chat check </h1>

I stop the macro from typing out stupid shit in the chat by using a check with the wiki button that you can enable in your chat box. This works since the wiki button disappears when you have the chat active.

![wiki_button](https://user-images.githubusercontent.com/32413258/200336150-76378ce1-6af9-4470-8f68-2769df8af667.png)

<h1> Aw man... how to start cheating? </h1>
Download the repository as a ZIP, place the .ahk file and images somewhere on your PC, edit the .ahk to make it work on your PC (list below). Run the .ahk file, and start cheating on gems?!


<h1> It don't working, man? </h1>
You'll have to change some of the code to work on your PC.

* You should not need to take your own pictures, unless you use different items, for example dungeoneering bladed dive switches, or use a different screen resolution. You will however definitely need to change the directory where the macro checks for the images.

* You will DEFINITELY need to supply your own coordinates for the checks, since your interface more than likely does not look exactly like mine.

* You might have to incorporate a chat check to the dual wield, flank, or caroming macro if the key you use for them is one you often use while chatting. Look at how it's done in other parts of the macro and you should be able to figure it out. In some cases you might want to remove a chat check if it is not needed. That is okay to do, but it should not hinder your macro usage if it remains.

* You might have to adjust some of the "Sleep x" commands depending on your ping, but I've never had to.

* The .ahk file has comments for all of the checks. You should be able to understand how they all work by reading the comments, if the above example did not do the job.
