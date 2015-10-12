#!/bin/bash
#NOTMINE thanks Github/UliArmy. 
#Needs: google-translate, dmenu, xsel, $FONT in .bashrc

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
    DMENU="dmenu -i -fn $FONT"
fi
#choice=$(echo | $DMENU -p "choose languages (<from> <to>):")

input="$(xsel -o)"
lang=`more ~/gtrans-lang | cut -d ' ' -f 2` #list is numbered by usage; ignore numbers. Aso log translations
choice=$(echo -e "$lang" | $DMENU -sb "#336600" -p "$input")
last=`more ~/gtrans-last` #last translation result.

case $choice in
    f) choice="xx fr";; 
    e) choice="xx en";; 
    p) choice="xx pl";; 
    d) choice="xx de";; 
    o) choice="xx eo";; 
    v) choice="xx lv";; 
    t) choice="xx lt";; 
    ef) choice="en fr";; 
    ep) choice="en pl";; 
    ed) choice="en de";; 
    fe) choice="fr en";; 
    fp) choice="fr pl";; 
    fd) choice="fr de";; 
    pe) choice="pl en";; 
    pf) choice="pl fr";; 
    pd) choice="pl de";; 
    de) choice="de en";; 
    df) choice="de fr";; 
    dp) choice="de pl";; 
    oe) choice="eo en";; 
    of) choice="eo fr";; 
    fo) choice="fr eo";; 
    po) choice="pl eo";; 
    ev) choice="en lv";; 
    !) leafpad d/gtrans.sh; exit ;; 
*) exit ;;
esac

#if [ "$last" != "$input" ]
#then
#     echo " " | xsel -i #resets selection
#fi

if [ "$choice" != ' ' ]
then
	input=$(xsel -o | $DMENU -p "$choice":)
	if [ "$input" != '' ]
	then
		#echo $input | tr \\n \\0 | xargs -0 google-translate $choice | $DMENU -p translation: | xsel -i
		echo $input | xargs -0 google-translate $choice | tr -d "\n" | xsel -i 
        echo $input > ~/gtrans-last
		~/d/gtrans.sh 
	fi
else
    exit
fi

# TODO note last used combinations to suggest them in order
# TODO show suggestions only from current lang pair
# TODO remember combination and don't ask every time.
