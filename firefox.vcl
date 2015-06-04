# Voice commands for firefox
git commit all = "git commit -am """"" {Left};
get = "git";
git create branch = "git checkout -b ";
function paren = "(";
find process = "ps aux | grep ";
find in files = {Ctrl+F};

Vim search = "/";
vim next search = "n";

#Mongo commands
Mongo find one <_anything>= "db.$1" {Tab} ".findOne()" {Enter};

#Console commands
repeat command = {Up} {Enter};

#Cloud nine
test that out = {Ctrl+s} {Alt+s} Wait(0) {Up} {Enter} {Alt+s};
switch to terminal ={Ctrl+s} {Alt+s};
comment that = {Ctrl+/};
handlebars curly brace = "{{{}}}" {Left_2};


#vim commands
<range> := 1..99;

normal(x) := {Esc} $x; 
insertnormal (x):= {Esc} $x {i};
excommand (x) := {Esc} :$x {Enter} ;
show (x):={Esc} $x {Enter};
<leader>:=",";

#Basic Tasks
open file= {Esc} ":e " ;
new file = {Esc} ":enew " ;
switch buffer= {Esc} ":b#" {enter} ;
#comment line= {Esc} "^i" {shift +3} ;
put after = insertnormal (p) ;
put before = insertnormal (P) ;
paste from clipboard  = insertnormal ('"+gP') ;
#Note that in the following base command insertnormal(p) gives a different result than insertnormal("p")
paste ( below | vim )= insertnormal (p) ;
( add| insert)= "a" ;
( add| insert) before = "i";
undo [that]= insertnormal ("u") ;
undo 1..10 = insertnormal ("$1u") ;

space previous = {Esc} "gE" ;
next space = {Esc} "W" Wait(0) {Left} ;

#characters movements
<direction> := (left =h | right =l | up = k | down = j);
<direction> 1..10= insertnormal ("$2$1") ;
<direction>  = insertnormal ("$1");

#characters edition
back=  {backspace} ;
back 1..10= {Backspace_$1} ;
erase = insertnormal ("x") ;
erase 1..20  = insertnormal ("$1x") ;
( delete | erase) character = insertnormal ("x") ;
delete 1..20 character =insertnormal ($1x) ;
replace= {Esc} "r" ;


#Words movements
endword(position) := {End} insertnormal($position'b') ;
( next = w| previous = b) word= insertnormal ($1) ;
( Right =w | Left =b) 1..99 words=  insertnormal ($2$1);
( last =1 | second last = 2) word= endword ($1) ;
#how to make the next command to work with account starting on one.
#Right now if the count starts at 1, the command that is passed to vim is "0w".
#The number 0 is a command by itself (to move to the very 1st character in a line (even blank spaces)).
word 2..9 = insertnormal (^) insertnormal (Eval($1-1) "w");
word 1 = insertnormal (^);
end of word= insertnormal ("e") ;

#Words edition
( replace = "diw" | destroy = "daw") word = insertnormal ($1) ;
destroy 1..4 words = insertnormal ("$1dw") ;
back one word= {Ctrl+w} ;
back 2..9 words = Repeat($1, {Ctrl+w}) ;
#is this command necessary? What about activating the possibility of speak several commands in a row?
#replace word 1..9 = {Esc} {Home} Repeat($1, {shift+Right}) "ciw" ;
( replace = "diw" | destroy = "daw")( last =1 | second last = 2) word= endword ($2) insertnormal ($1);

#Line operations
create line = {Esc} "o" ;
create paragraph= normal ("o") normal ("o");
( create | insert) line above = {Esc} "O" ;
( copy | yank ) line= insertnormal ('yy');
in-line search = {Esc} "f" ;
duplicate line= {yyp};
copy 2..9 lines= {Esc} "$1yy" ;
show lines= {Esc} ":set number" {Enter} "i" ;
line 1..999 = {Esc} "$1gg"  "i" ;
go to the beginning= {Esc} "gg" "i" ;
end of [the] line = insertnormal ( "$" ) ;
go to the last line = {Esc} "G" ;
go to the end = {Esc} "G";
last line = {Esc} "G" ;
destroy <range> comma <range>  = excommand ("$1,$2d") ;
destroy line <range>  = excommand ("$1d") ;
destroy line = {Esc} "dd" "i" ;
destroy 2..20 lines= {Esc} "$1dd" "i" ;

#Modes
insert mode= "i" ;
command mode= {Esc} ":" ;
execute= {Enter} ;

#Save, close, etc.
(exit | quit)= {Esc} ":q" {Enter} ;
force (exit | quit)= {Esc} ":q!" {Enter} ;
save file = insertnormal (":w") {Enter} ;
save as = {Esc} ":w " ;
save and close = {Esc} ":wq" {Enter} ;
terminal = {Esc} {Ctrl+z} ;
try it out = {Esc} ":w" {Enter} {Ctrl+z} ;

#Environment viable
( echo | expand) <variable>  = excommand ("echo $2") ;
<variable> := (
home = "\$HOME"
| gvim = "\$GVIM"
| vim = "\$VIM" 
) ;

#RC files
RC file = excommand ("edit C:/Users/Javi/Dropbox/vimfiles/.vimrc" ) ;
RC ( system = "\$VIM/vimrc" | user = "\$MYVIMRC" ) = excommand ("edit $1") ;
graphical RC ( system = "\$VIM/gvimrc" | user = "\$MYGVIMRC" ) = excommand ("edit $1") ;
reload RC= excommand ("source \$MYVIMRC") ;

#Local options
show option <options>= "setlocal  $1";
#  show ( normal | selection) map <modifier> <letters> = excommand ("verbose map <$2-$3>") ;
# show ( insert | command line) map <modifier> <letters> = excommand ("verbose map! <$2-$3>") ;

( normal | selection) map <keys> = excommand ("verbose map <$2>") ;
( insert | command line) map <keys> = excommand ("verbose map! <$2>") ;

<keys> := ( Enter = CR  );
<modifier> := ( control =c | alternative =a);
<options> := (
	tabstop
	| softtabstop
	| shiftwidth
	| textwidth   
	| smarttab
	| expandtab
);

#Global options
check file type = show (:filetype) ;
show version = show (:version) ;

#help
help <subjects>  = excommand ("help $1") ;
<subjects> := ( index | set );

#indentation
indent= {Ctrl+t} ;
dedent= {Ctrl+d} ;

#Python specific
check syntax = excommand ("make") ;
run= insertnormal ({F5});

#Comments (the plug-in nerdcommander is used for commenting)
comment line =  {Esc} ',c' {Space} i;
comment line two = insertnormal (',c' {Space}) ;
comment line three = insertnormal (",c" {Space}) ;