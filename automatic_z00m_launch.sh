#!/bin/sh


# Set the date & time of starting the zoom app
cmp=`date -j -f "%Y-%m-%d %H:%M:%S" "2020-10-22 13:03:30" "+%s"`

# Wait until the time
while :
do
if [ `date +%s` -lt $cmp ]; then # -lt : '<'
        echo 'Waiting... '
        sleep 60		# check every 60 seconds
else
        break
fi
done

# Open zoom (change the meeting ID) 
open zoommtg:"//zoom.us/join?confno=99210180349"

# Change current directory to shellscript's
cd "$(dirname "$0")"

# Run the recording
osascript ./z00m_recording.applescript