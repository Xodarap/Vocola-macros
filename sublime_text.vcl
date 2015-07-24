# Voice commands for sublime_text


dot = ".";
underscore = "_";
equals = "=";
module separator = "::";
ruby print = "p ";
to string = "to_s";
regex compare = "=~";
Ruby else if = "elsif";
array bracket = "[";
function paren = "(";
XML block = "<<-XML" {Enter} {Enter} "XML" Wait(0) {Up} {Tab} {Tab};
Ruby block = "do ||" {Enter} "end" Wait(0) {Up} {End} {Left};
nil test = ".nil?";
String interpolate = "#{}" {Left};


Next tab ={Ctrl+PgDn};
previous tab ={Ctrl+PgUp};
kill rest of line = {Shift+End} Wait(0) {Ctrl+x};
<direction>:= (Right | Left);
<n> := 0..99;
<word> := (word | words);
move <n> <word> <direction>= Repeat($1,{Ctrl+$3});
<np> := (Next = Right | Previous = Left);
<action> := (delete = Del);
select <np> <n> <word> = Repeat($2,{Ctrl+Shift+$1});
AddLineAtEnd() := {End} Wait(0) {Enter};
add line after this = AddLineAtEnd();
#add line after line <n> = touch(0,$1) Wait(0) AddLineAtEnd();
comment that ={Ctrl+/};
test that out = {Ctrl+s} Wait(0) AppBringUp("powershell") Wait(0) {Up} Wait(0) {Enter};

CDA <_anything> = "cda:" $1;