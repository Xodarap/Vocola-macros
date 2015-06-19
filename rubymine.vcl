# Voice commands for rubymine

dot = ".";
underscore = "_";
equals = "=";
module separator = "::";

new method <_anything>	= "def " $1;
instance <_anything> = {@} $1 {Ctrl+Space};
IntelliSense = {Ctrl+Space};
comment that = {Ctrl+/};