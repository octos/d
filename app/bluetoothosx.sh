#!/bin/sh
# first install blueutil, 'brew install blueutil'
# next create a new Keyboard Maestro macro
# add a Execute Shell Action action to script and paste in the following:

bluetooth=$(/usr/local/bin/blueutil)
is_on="Power: 1"
if [[ "$bluetooth" =~ "$is_on" ]];
then
	/usr/local/bin/blueutil power 0
else
	/usr/local/bin/blueutil power 1
fi
