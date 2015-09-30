#!/bin/sh
#v.150930X online radio player
case $1 in
  prog|2f30) s="http://radio.2f30.org:8000/live.ogg" ;;
  sdf) s="http://anonradio.net:8000/anonradio" ;;
  country|94) s="http://ckklfm-mp3.akacast.akamaistream.net/7/541/102120/v1/astral.akacast.akamaistream.net/ckklfm-mp3" ;;
  kexp|903) s="http://live-aacplus-64.kexp.org/kexp64.aac" ;;
  eo) s="http://listen.radionomy.com/muzaikoinfo.m3u" ;;
  *) less $0 | sed '1d' ;; esac
mpv -no-cache -really-quiet $s
