# Voice commands for powershell

argument <_anything> = " --" $1 " ";
flag <_anything> = " -" $1 " ";

#git
get = "git ";
git commit all = "git commit -am """"" {Left};
git create branch = "git checkout -b ";

#Console commands
repeat command  = {Up} {Enter};
repeat command 1..5 = {Up_$1} {Enter};
CD up = "cd ../" {Enter};
complete and run = {Tab} Wait(0) {Enter};
change directory = "cd ";
change directory <_anything> = "cd $1";

Really end = "y" {Enter} "y" {Enter};