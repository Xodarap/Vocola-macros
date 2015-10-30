 # Voice commands for putty
#include "vim.vch";
include "emacs.vch";
git = "git";

find process = "ps aux | grep ";
find process <_anything> = "ps aux | grep $1 "; 
complete and run = {Tab} {Enter};
nano save and exit = {Ctrl+o} Wait(1) {Enter} Wait(1) {Ctrl+x}; 
fix duplicate = {Home} {Del} {End};
repeat command = {Up} {Enter};
CD up = "cd ../" {Enter};
complete and run = {Tab} Wait(0) {Enter};
repeat command 1..5 = {Up_$1} {Enter};
fix duplicate = {Home} {Del} {End};

#Git
git pull = "git pull --ff-only" {Enter};
git commit all = "git commit -am """"" {Left};
git status = "git status" {Enter};
git stash = "git stash" {Enter};
git checkout master = "git checkout master" {Enter};
git create branch = "git checkout -b ";

bundle install = "bundle install" {Enter};
bundle exec rails console = "bundle exec rails console" {Enter};
bundle exec rails server = "RAILS_ENV=development bundle exec rails server --bind 0.0.0.0" {Enter};
bundle exec sidekiq = "bundle exec sidekiq" {Enter};
bundle exec rake test = "bundle exec rake test" {Enter};

bower install = "bower install --allow-root" {Enter};

Really end = "y" {Enter} Wait(1) "y" {Enter};
<YesNo> := (yes =y| no =n | diff =d);
answer <YesNo>= "$1" {Enter};

#Debugging
debug next = "next" {Enter};
debug next 1..10 = "next $1 " {Enter}; 
debug step = "step" {Enter};
debug continue = "continue" {Enter};
debug finish = "finish" {Enter};

#Shortcut directories
<shortcut_directory> := (health eFilings = /mnt/docs/RubymineProjects/Health-eFilings
			| health data standards =/mnt/docs/RubymineProjects/hef-health-data-standards
			| quality measures engine = /mnt/docs/RubymineProjects/hef-quality-measure-engine);
change directory = "cd ";
change directory <shortcut_directory> = "cd $1" {Enter};
change directory <_anything> = "cd $1" {Tab};


Cypress password = "CypressPwd" {Enter};
run login = "ubuntu" {Enter} Wait(1) "CypressPwd" {Enter} Wait(3) "sudo -i" {Enter} Wait(1) "CypressPwd" {Enter} Wait(3) "cd /mnt/docs/RubymineProjects/Health-eFilings" {Enter};

#Tmux
tmux split horizontally = {Ctrl+b} Wait(0) {""""};
tmux close pane = {Ctrl+b} Wait(0) {x} Wait(0) {y};
tmux new window = {Ctrl+b} Wait(0) {c};
next tab = {Ctrl+b} Wait(0) {n};
previous tab = {Ctrl+b} Wait(0) {p};
tab 0..9 = {Ctrl+b} Wait(0) {$1};

<tmux_direction>:= (Up| Down =Dn| Left| Right);
tmux pain <tmux_direction> = {Ctrl+b} Wait(0) {$1};
tmux switch panes = {Ctrl+b} Wait(0) {o};


# Things that exist in other applications but are different here
paste that = {Shift+Ins};
find text <_anything> = {Ctrl+r} Wait(0) $1;