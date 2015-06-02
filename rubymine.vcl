# Voice commands for rubymine

dot = ".";
underscore = "_";
equals = "=";
module separator = "::";

new method <_anything>	= "def " $1;
snake <_anything> = Format.underscore($1) {Ctrl+Space};
instance <_anything> = {@} $1 {Ctrl+Space};
Scope <_anything> = Format.scoperesolve($1) {Ctrl+Space};
Pascal <_anything> = Format.pascal($1) {Ctrl+Space};
IntelliSense = {Ctrl+Space};
uppercase <_anything> = Format.allcaps($1) {Ctrl+Space};