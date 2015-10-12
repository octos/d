#!/bin/sh
#v.150930X online radio player
[ -z "$1" ] && sed '1d' $0 && exit
for a in $@; do
case $a in
  prog|2f30) aa="http://radio.2f30.org:8000/live.ogg" ;;
  sdf) ab="http://anonradio.net:8000/anonradio" ;;
  country|94) ac="http://ckklfm-mp3.akacast.akamaistream.net/7/541/102120/v1/astral.akacast.akamaistream.net/ckklfm-mp3" ;;
  kexp) ad="--force-seekable=yes -start 14" s="http://live-aacplus-64.kexp.org/kexp64.aac" ;;
  eo) ae="http://listen.radionomy.com/muzaikoinfo.m3u" ;;
  rmf) af="http://rmfstream3.interia.pl:8003/rmf_fm" ;;
  -e) $EDITOR $0; exit ;;
  *) sed '1d' $0; exit;; esac
done
s=""$aa" "$ab" "$ac" "$ad" "$ae" "$af""
#mpv -no-ytdl -no-cache -really-quiet $o $s
echo $a
mpv -no-ytdl -no-cache -quiet $o $s
