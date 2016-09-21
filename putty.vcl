 # Voice commands for putty
#include "vim.vch";
#include "emacs.vch";
include "string.vch";
git = "git";
first= "first";
json = "json";
Jason = "json";

find process = "ps aux | grep -i ";
find process <_anything> = "ps aux | grep -i $1 "; 
complete and run = {Tab} {Enter};
nano save and exit = {Ctrl+o} Wait(1) {Enter} Wait(1) {Ctrl+x}; 
fix duplicate = {Home} {Del} {End};
repeat command = {Up} {Enter};
CD up = "cd ../" {Enter};
ls = "ls" {Enter};
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
git squash = {Home} {Del_4} "s" {Left};

bundle install = "bundle install" {Enter};
bundle exec rails console = "bundle exec rails console" {Enter};
bundle exec rails server = "RAILS_ENV=development bundle exec rails server --bind 0.0.0.0" {Enter};
bundle exec sidekiq = "bundle exec sidekiq -c 1" {Enter};
bundle exec rake test = "bundle exec rake test" {Enter};
bundle exec [rake] assets precompile = "RAILS_ENV=production bundle exec rake assets:precompile && git add public/assets/* && git commit --message 'assets precompile'" {Enter};
bundle exec [rake] [db] migrate = "bundle exec rake db:migrate" {Enter};
bundle exec [rake] seed = "bundle exec rake db:seed" {Enter};
bundle exec rubocop = "bundle exec rubocop" {Enter};

<catalyze_environment> := (Harrisburg = catalyze-harrisburg| production);
<catalyze_command> := (Postgres = console database-2 | rails);
run_catalyze(environment, command) := "catalyze -E $environment console $command" {Enter};
catalyze <catalyze_command> <catalyze_environment> = run_catalyze($1, $2);

make Medicare patient = "catalyze -E production rake hef:make_medicare_patient[";
catalyze console ="catalyze -E catalyze-harrisburg console code-1 ""bundle exec rails console""" {Enter};
catalyze Postgres console = "catalyze -E catalyze-harrisburg console database-2" {Enter};

bower install = "bower install --allow-root" {Enter};
tig = "tig" {Enter};
top = "top" {Enter};

switch tenant <_anything>= "Apartment::Tenant.switch! '" Lower($1) "1'" {Enter};

Really end = "y" {Enter} Wait(1) "y" {Enter};
<YesNo> := (yes =y| no =n | diff =d);
answer <YesNo>= "$1" {Enter};

#Debugging
debug next = "next" {Enter};
debug next 1..20 = "next $1 " {Enter}; 
debug step = "step" {Enter};
debug continue = "continue" {Enter};
debug finish = "finish" {Enter};

#Shortcut directories
<shortcut_directory> := (health eFilings = /mnt/docs/RubymineProjects/Health-eFilings
			| health data standards =/mnt/docs/RubymineProjects/hef-health-data-standards
			| quality measures engine = /mnt/docs/RubymineProjects/hef-quality-measure-engine
			| EHRI = /mnt/docs/RubymineProjects/ehri
			| PPS = /mnt/docs/pps
			| home = /root
			| E drive = /mnt/e_drive
			| Lebesgue = /mnt/docs/RubymineProjects/Lebesgue);
change directory = "cd ";
change directory <shortcut_directory> = "cd $1" {Enter};
change directory <_anything> = "cd $1" {Tab} {Enter};


Cypress password = "CypressPwd" {Enter};
run login = "ubuntu" {Enter} Wait(100) "CypressPwd" {Enter} Wait(300) "sudo -i" {Enter} Wait(100) "CypressPwd" {Enter} Wait(300) "cd /mnt/docs/RubymineProjects/Health-eFilings; sudo ntpdate time.nist.gov; tmux new" {Enter};
switch IP 1..30 = ". /root/mounts.sh $1" {Enter};

#Tmux
tmux split horizontally = {Ctrl+b} Wait(0) {""""};
tmux split vertically = {Ctrl+b} Wait(0) {%};
tmux close pane = {Ctrl+b} Wait(0) {x} Wait(0) {y};
tmux new window = {Ctrl+b} Wait(0) {c};
next tab = {Ctrl+b} Wait(0) {n};
previous tab = {Ctrl+b} Wait(0) {p};
tab 0..9 = {Ctrl+b} Wait(0) {$1};

<tmux_direction>:= (Up| Down =Dn| Left| Right);
tmux pain <tmux_direction> = {Ctrl+b} Wait(0) {$1};
tmux switch panes = {Ctrl+b} Wait(0) {o};
tmux pain to new window = {Ctrl+b} {!};


# Things that exist in other applications but are different here
paste that = {Shift+Ins};
find text <_anything> = {Ctrl+r} Wait(0) $1;