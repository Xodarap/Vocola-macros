# Voice commands for rubymine
include "string.vch";
dot = ".";
underscore = "_";
equals = "=";
module separator = "::";
close tab = {Ctrl+F4};
view run window = {Alt+4};
view debug window = {Alt+5};
view git window = {Alt+9};
next tab = {Alt+Right};
previous tab = {Alt+Left};
find usages = {Alt+F7};
evaluate expression = {Alt+F8};
go to definition ={Ctrl+b};
debug again = {Shift+F9};
run again = {Shift+F10};
go to line 1..99 = {Ctrl+g} Wait(1) $1 {Enter};
previous page = {Alt+Ctrl+Left};
next page = {Alt+Ctrl+Right};
first = "first";



new method <_anything>	= "def " $1;
instance <_anything> = {@} $1 {Ctrl+Space};
IntelliSense = {Ctrl+Space};
comment that = {Ctrl+/};
format that = {Ctrl+Alt+l};

Find in files = {Ctrl+F};

#HTML stuff
HTML <_anything>= "<" Lower($1) {>};
attribute <_anything>= " " Lower($1) "=""";

#debugging
step into = {F7};
step over = {F8};
step out = {Shift+F8};
resume program = {F9};

#Git
#git rebase = {Alt+s} Wait(1)
git push = {Ctrl+k};
git pull = {Ctrl+t};
git switch branch = {Alt+s} Wait(10) {g} Wait(1) {b};