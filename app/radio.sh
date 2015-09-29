#!/bin/sh
ver=150928X # online radio stations made easy
case $1 in
  2f30|prog) station="http://radio.2f30.org:8000/live.ogg" ;;
  sdf) station="http://anonradio.net/listen" ;;
  94|country) station="http://ckklfm-mp3.akacast.akamaistream.net/7/541/102120/v1/astral.akacast.akamaistream.net/ckklfm-mp3" ;;
esac

mpv -no-cache $station 2>&1 >/dev/null
