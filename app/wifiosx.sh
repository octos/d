#!/bin/sh
#v.160104X Toggle WiFi on OS X
device="$(networksetup -listallhardwareports |
grep -E '(AirPort|Wi-Fi)' -A 1 | grep -o "en.")"
[[ "$(networksetup -getairportpower $device)" == *On ]] && val=off || val=on
networksetup -setairportpower $device $val
