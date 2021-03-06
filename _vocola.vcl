# Global voice commands
include "string.vch";
include "URLs.vch";

#Find text <_anything> = {Ctrl+f} Wait(0) $1  {Enter};
start bullet list = "* ";
start numbered list = "1. ";
Copy and paste that = {Ctrl+c} Wait(0) {Ctrl+v};
save that = {Ctrl+s};
space paste that = " " HeardWord(paste, that);

space snake <_anything> = " " Replace(Lower($1)," ","_");
snake <_anything> = Replace(Lower($1)," ","_");
Pascal <_anything> = Eval("''.join(x for x in $1.title() if not x.isspace())");
space Pascal <_anything> = " " Eval("''.join(x for x in $1.title() if not x.isspace())");
#uppercase <_anything> = Format.allcaps($1);
space dash word <_anything> = " " Replace(Lower($1)," ","-");
dash word <_anything> =  Replace(Lower($1)," ","-");
studded <_anything> =" " Replace($1," ",".");
Camel <_anything> = Eval("$1[0].lower() + ''.join(x for x in $1.title() if not x.isspace())[1:]");
space Camel <_anything> = " " Eval("$1[0].lower() + ''.join(x for x in $1.title() if not x.isspace())[1:]");

simon says <_anything> = $1;

#Array bracket = "[";
#empty function = "()";

# html

HTML cell header = "<th>";
HTML cell header end = "</th>";
HTML cell = "<td>";
HTML cell end = "</td>";

#Ruby
ruby rocket = " => ";
pretty print = "pp ";
ruby in-line block = " {||}" {Left_2};
ruby in-line block <_anything>= " {|" Lower($1) "|}" {Left};
Ruby block = " do ||" {Left};
Ruby block <_anything> = " do |" Lower($1) "|" {Enter};


<website> := (GitHub = https://github.com/Xodarap/Health-eFilings
		| GitHub new issue =https://github.com/Xodarap/Health-eFilings/issues/new
		| Gmail = https://mail.google.com
		| Facebook = www.Facebook.com
		| hackpad = healthefilings.hackpad.com
		| hackpad Ben [weekly] = https://healthefilings.hackpad.com/Bens-weekly-progress-MeaK6FizD45
		| hackpad Nathan =https://healthefilings.hackpad.com/Nathan-trackingPrivate-Hi17KNIwwlK
		| hackpad Oscar = https://healthefilings.hackpad.com/Oscar-tracking-eOZla3pguIo
		| hackpad Oscar weekly = https://healthefilings.hackpad.com/Oscars-weekly-progress-mBuHDOd4tsw
		| hackpad standup = https://healthefilings.hackpad.com/Standup-meeting-notes-1N8kik0SuFb
		| hackpad Jeff = https://healthefilings.hackpad.com/Jeff-tracking-DouI3cefK5P
		| hackpad Jeff weekly = https://healthefilings.hackpad.com/Jeffs-Weekly-Progress-Qo444E1RqMn
		| hackpad Donato = https://healthefilings.hackpad.com/Donato-tracking-0lPsTEtPgWp
		| hackpad Donato weekly = https://healthefilings.hackpad.com/Donatos-weekly-progress-EUc5W2M9Tas
		| stack overflow = stackoverflow.com 
		| LinkedIn = LinkedIn.com
		| crunch base = crunchbase.com
		| healthefilings = healthefilings.com
		| Google drive =https://drive.google.com/drive/u/0/my-drive
		| waffle = https://waffle.io/Xodarap/Health-eFilings
		| CHPL = https://chpl.healthit.gov/#/search
		| production = https://mdp.healthefilings.com/
		| vsac = https://vsac.nlm.nih.gov/
		| Zoho = https://crm.zoho.com/crm/ShowHomePage.do);
<TLD> := (com | net | org);
Navigate to <website> = ShellExecute("chrome.exe $1");	
navigate to <_anything> .com= ShellExecute("chrome.exe $1.com");	
navigate to <_anything> . <TLD>= ShellExecute("chrome.exe $1.$2");	
			


### Switch applications, windows, and panels

Switch Window = SendSystemKeys( {Alt+Tab} );
Copy and Switch  = {Ctrl+a}{Ctrl+c} SendSystemKeys( {Alt+Tab} );
Copy to (NatSpeak|Emacs|Composition)
    = {Ctrl+a}{Ctrl+c} HeardWord(switch,to,$1);
Close Here = ButtonClick(2,1) Wait(100) c;
Close Window = {Alt+Space}c;
Switch to Browser = AppBringUp(iexplore);

(Switch|Next) View     = {Ctrl+Tab};
(Switch|Next) View <n> = {Ctrl+Tab_$2};
Previous View     = {Ctrl+Shift+Tab};
Previous View <n> = {Ctrl+Shift+Tab_$1};

Tab Back     = {Shift+Tab};
Tab Back <n> = {Shift+Tab_$1};

# Open/Close a drop-down list
(Expand={Alt+ExtDown} | Collapse={Alt+ExtUp}) That = SendSystemKeys($1);

### NatSpeak

Dragon Menu              = SendSystemKeys( {NumKey*} );
(Edit=v | Train=t) Words = SendSystemKeys( {NumKey*} ) Wait(100) w $1;
Save Speech Files        = SendSystemKeys( {NumKey*} ) Wait(100) ff;
Exit NatSpeak            = SendSystemKeys( {NumKey*} ) Wait(100) e;
Die Die = GoToSleep();

#
# IE
#
[search] Google for <_anything> = AppBringUp("IEXPLORE") {Alt+g}$1{Enter} ;

# ---------------------------------------------------------------------------
# Mouse Handling

Hit Down   = ButtonClick();
Hit Double = ButtonClick(1,2);
(Shift=1 | Control=2 | Alt=3) Click = ShiftKey($1) ButtonClick();
Hit Start [Menu] = SendSystemKeys( {Ctrl+Esc} );

### Straight mouse grid commands. (See documentation in utilities.vch)

include utilities.vch;
<n> := 0..99;

<n> <n> Go    = moveTo($2, $1);
<n> <n> Touch =  touch($2, $1);
<n> <n> Drag  = dragTo($2, $1);
<n> <n> Paste =  touch($2, $1) {Ctrl+v};

<upDown>    := (  Up='-' |  Down='');
<leftRight> := (Left='-' | Right='');

Drag <n> <upDown>    = dragBy(0, $2$1);
Drag <n> <leftRight> = dragBy($2$1, 0);

### Move and resize windows

<edge> := (Top=n | Bottom=s | Left=w | Right=e);

[Move] Window <n> <upDown>    = moveNearEdge(n,0,1) dragBy(0, $2$1);
[Move] Window <n> <leftRight> = moveNearEdge(n,0,1) dragBy($2$1, 0);
[Move] Window Northwest = moveNearEdge(nw,2,1) dragTo(2,1);
[Move] Window Northeast = moveNearEdge(ne,-5,1) dragTo(95,1);

[Size] Window <edge> <n> <upDown>    = moveToEdge($1) dragBy(0, $3$2);
[Size] Window <edge> <n> <leftRight> = moveToEdge($1) dragBy($3$2, 0);

Maximize Window = touchNearEdge(ne,-2,1);

Tile Windows     = tileWindows(0);
Tile Windows <n> = tileWindows($1);  # Edge is <n> units right of center

# ---------------------------------------------------------------------------
# Text Editing

<direction>  := Left | Right | Up | Down;
<left_right> := Left | Right;
<up_down> := Up | Down;
<start_end> := (Start={Home} | End={End});

### Characters
<n> [Lines] <direction>       = {$2_$1};
Kill (Char | 1 | One) = {Del};
Kill Back [1]         = {Backspace};
Kill <n>              = {Del_$1};
[Kill] Back <n>       = {Backspace_$1};

### Words
[One] Word <left_right>= {Ctrl+$1};
<n> Words <left_right> = {Ctrl+$2_$1};
Kill Word              = {Right_2}{Ctrl+Left}{Shift+Ctrl+Right}   {Del};
Kill <n> Words         = {Right_2}{Ctrl+Left}{Shift+Ctrl+Right_$1}{Del};
Kill Back Word         = {Left}{Ctrl+Right}{Shift+Ctrl+Left}   {Del};
Kill Back <n> Words    = {Left}{Ctrl+Right}{Shift+Ctrl+Left_$1}{Del};

### Lines
Line <start_end>     = $1;
New Line             = {Enter};
Line Here            = {Enter}{Left};
Copy Line            = {home}{Shift+Down}{Shift+Home}{Ctrl+c};
Kill Line            = {home}{Shift+Down}{Shift+Home}{Del};
Kill Back Line       = {home}{Shift+Up}  {Shift+Home}{Del};
Kill <n> Lines       = {home}{Shift+Down_$1}{Shift+Home}{Del};
Kill Back <n> Lines  = {home}{Shift+Up_$1}  {Shift+Home}{Del};
Kill Here            = {Shift+End}{Del};
Kill Back Here       = {Shift+Home}{Del};
Duplicate Line       = {home}{Shift+Down}{Shift+Home}{Ctrl+c}{Home}{Ctrl+v};
insert line after this = {end}{Enter};
insert line before this = {home}{Enter} {Up};
copy rest of line	= {Shift+End}{Ctrl+c};
cut rest of line	= {Shift+End} {Ctrl+x};
end line with <_anything>= {End} $1;
              
### Paragraphs        
Graph Start          = {Ctrl+Up}{Right}{Home};
Graph End            = {Ctrl+Down}{Left_2}{End};
(Paragraph|Graph) Here = {Enter}{Enter}{Left}{Left};
Open (Graph|Line)    = {Enter}{Enter}{Left};
Copy Graph           = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c};
Kill Graph           = {Ctrl+Down}{Shift+Ctrl+Up}{Del};
insert graph after this = {end}{Enter}{Enter};
insert graph before this = {home}{Enter}{Enter};
Duplicate Graph      = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c}{Home}{Ctrl+v};
                    
### Entire "Flow"   
Flow Start           = {Ctrl+Home};
Flow End             = {Ctrl+End};
Select All           = {Ctrl+a};
Copy All             = {Ctrl+a}{Ctrl+c};
(Cut|Kill) All       = {Ctrl+a}{Ctrl+x};
Kill Flow Here       = {Ctrl+Shift+End} {Ctrl+x};
Kill Back Flow Here  = {Ctrl+Shift+Home}{Ctrl+x};
Replace All          = {Ctrl+a}{Del}{Ctrl+v};
                    
### Selection         
Kill That            = {Del};
Cut That             = {Ctrl+x};
#Copy That            = {Ctrl+c};
Yank That            = {Ctrl+v};
Paste Here           = ButtonClick() {Ctrl+v};
Duplicate That       = {Ctrl+c}{Left}{Ctrl+v};
Keep That            = {Ctrl+c}{Ctrl+a}{Del}{Ctrl+v};

### Miscellaneous
Undo <n> = {Ctrl+z_$1};
Camel [Case] That = HeardWord(\Cap,That) HeardWord(compound,that) {Ctrl+Left}
                    {Shift+Right} HeardWord(\No-Caps,That){Ctrl+Right};
(Cap | Up Case) <n> = {Shift+Right_$2} HeardWord(\All-Caps,That);

include keys.vch;

# ---------------------------------------------------------------------------
# Commands for Windows XP (that work differently under Windows 2000)

Recent Documents = SendSystemKeys({Ctrl+Esc}) {Home}{Right_2};
Run Program     =  SendSystemKeys({Ctrl+Esc}) {Up_4}{Enter};

Environment Variables = SendSystemKeys({Ctrl+Esc}) c Wait(1000) 
                        sssssss{Enter} Wait(1000) "{Right 3}{Alt+n}";

# Taskbar commands

launchBar()  := SendSystemKeys({Ctrl+Esc}) {Tab};
taskBar()    := SendSystemKeys({Ctrl+Esc}) {Tab_7};
systemTray() := SendSystemKeys({Ctrl+Esc}) {Tab_3};
<1to20> := 1..20;

Launch <1to20> = launchBar() {Left}{Right_$1} " ";

Switch to <1to20> [Right] = taskBar()        {Left_$1} " ";
Exit     <1to20> [Right] = taskBar()        {Left_$1} " {Alt+F4}";
Switch to <1to20> Left    = taskBar() {Left}{Right_$1} " ";
Exit 	<1to20> Left    = taskBar() {Left}{Right_$1} " {Alt+F4}";

# ---------------------------------------------------------------------------
# Commands for Windows 2000 (that work differently under Windows XP)

#Recent Documents = SendSystemKeys({Ctrl+Esc}) {Up_6}{Right};
#Run Program      = SendSystemKeys({Ctrl+Esc}) {Up_2}{Enter};
#
#Environment Variables = 
#    AppBringUp("C:\WINNT\System32\SYSDM.CPL") # Control Panel "System"
#    {Shift+Tab}{Right_4}{Alt+e};              # "Advanced" tab, "Env..." button
#
## Taskbar commands
#
#taskBar()   := SendSystemKeys({Ctrl+Esc}) {Esc}{Tab_2};
#launchBar() := SendSystemKeys({Ctrl+Esc}) {Esc}{Tab};
#<1to20> := 1..20;
#
#Switch to <1to20> [Right] = taskBar() {Right_20}{Left_$1}{Right} " ";
#Close     <1to20> [Right] = taskBar() {Right_20}{Left_$1}{Right} " " {Alt+F4};
#Switch to <1to20> Left    = taskBar() {Right_$1} " ";
#Close     <1to20> Left    = taskBar() {Right_$1} " " {Alt+F4};
#
#Launch <1to20> = launchBar() {Left}{Right_$1} " ";

# ---------------------------------------------------------------------------
# Context-Sensitive Commands

include folders.vch;

### Commands for "file browse" dialog boxes

Open | New | Save | File | Attachment | Browse | Directory:
  Folder <folder> = {Ctrl+c}$1\{Enter};
  Go Up = ..{Enter};
  Go Up <n> = Repeat($1, ..\) {Enter};
  Folder List = {Shift+Tab_2}{Down}{PgUp};
  Choose <n> = {Down_$1}{Enter}{Esc};
