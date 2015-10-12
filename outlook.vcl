# Voice commands for outlook
cc <_anything> = {Alt+C} $1 {Tab} HeardWord (go, to, body);
<relativeday> := (today| tomorrow);
follow up <relativeday> = HeardWord(click, follow, up) Wait(0) HeardWord(click, $1);
<relativeweek> := (this | next);
follow up <relativeweek> week = HeardWord(click, follow, up) Wait(0) HeardWord(click, $1, week);
<dayOfWeek>:= (Monday| Tuesday| Wednesday| Thursday| Friday| Saturday| Sunday);
follow up <dayOfWeek> = HeardWord(click, follow, up) Wait(0) HeardWord(click, custom)
				Wait(1) HeardWord(click, start, date)
				Wait(1) $1 {Tab} {Enter};

