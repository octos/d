#!/bin/sh
#v.150930X online radio player
s=0; case $1 in
  prog|2f30) o="http://radio.2f30.org:8000/live.ogg" ;;
  sdf) o="http://anonradio.net:8000/anonradio" ;;
  country|94) o="http://ckklfm-mp3.akacast.akamaistream.net/7/541/102120/v1/astral.akacast.akamaistream.net/ckklfm-mp3" ;;
  kexp|903) s=15 o="http://live-aacplus-64.kexp.org/kexp64.aac" ;;
  eo) o="http://listen.radionomy.com/muzaikoinfo.m3u" ;;
  -e) $EDITOR $0 ;;
  *) less $0 | sed '1d' ;; esac
mpv -no-cache -really-quiet --force-seekable=yes -start $s $o
