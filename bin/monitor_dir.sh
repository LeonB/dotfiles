#!/bin/bash
# monitor file changes in a target directory

if [ "$*" = "" ]; then
 echo "File Monitoring"
 echo "USAGE: $0 <target directory>" | sed "s/.\///g"
 echo ""
 exit 0
fi

LOGDIR="$HOME/.inotify"

if [ ! -d $LOGDIR ]; then
 mkdir -p $LOGDIR
fi

TARGET_DIR="$*"
LOGNAME="$LOGDIR/`date -I`.log"

inotifywait -m -r --format '%T %e %w%f' --timefmt '%F %T' -e modify -e move -e create -e delete $TARGET_DIR | while read line
do
echo "$line" >> $LOGNAME
done

exit 0
