#!/bin/bash

#Kill all chrome instances
/usr/bin/killall {chromium-browser,chrome} --quiet

#Clean up sqlite databases
/usr/bin/find $HOME/.config/{chromium,google-chrome}/Default -type f -name "History" -o -name "History Index *" -o -name "Archived History" -exec sqlite3 {} "delete from urls where last_visit_time <= (strftime('%s',(select max(last_visit_time)/10000000 from urls),'unixepoch','-31 days')*10000000);" \;

#Remove history database
#rm ~/.config/chromium/Default/History\ Index\ *
/usr/bin/find $HOME/.config/{chromium,google-chrome}/Default -type f -name "History Index *" -exec rm {} \;
