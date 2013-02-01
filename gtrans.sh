#!/bin/bash
# Github/UliArmy
if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi


#choice=$(echo | $DMENU -p "choose languages (<from> <to>):")
# you can also put in some custom defaults, like this
 choice=$(echo -e "de en\nen de\nen fr\nfr en\npl fr" | $DMENU -p "choose languages (<from> <to>):")
# I didn't put that in, so it fits for everyone. Please customize it to what you prefer!


if [ "$choice" != '' ]
then
	input=$(xsel -o | $DMENU -p "$choice":)
	if [ "$input" != '' ]
	then
		echo $input | tr \\n \\0 | xargs -0 google-translate $choice | $DMENU -p translation: | xsel -i
	fi
fi
