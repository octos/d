#!/usr/bin/env sh
# ranger supports enhanced previews.  If the option "use_preview_script"
# is set to True and this file exists, this script will be called and its
# output is displayed in ranger.  ANSI color codes are supported.

# NOTES: This script is considered a configuration file.  If you upgrade
# ranger, it will be left untouched. (You must update it yourself.)
# Also, ranger disables STDIN here, so interactive scripts won't work properly

# Meanings of exit codes:
# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | success. display stdout as preview
# 1    | no preview | failure. display no preview at all
# 2    | plain text | display the plain content of the file
# 3    | fix width  | success. Don't reload when width changes
# 4    | fix height | success. Don't reload when height changes
# 5    | fix both   | success. Don't ever reload

# Meaningful aliases for arguments:
path="$1"    # Full path of the selected file
width="$2"   # Width of the preview pane (number of fitting characters)
height="$3"  # Height of the preview pane (number of fitting characters)

maxln=200    # Stop after $maxln lines.  Can be used like ls | head -n $maxln

# Find out something about the file:
mimetype=$(file --mime-type -Lb "$path")
extension=${path##*.}

# Functions:
# runs a command and saves its output into $output.  Useful if you need
# the return value AND want to use the output in a pipe
try() { output=$(eval '"$@"'); }

# writes the output of the previouosly used "try" command
dump() { echo "$output"; }

# a common post-processing function used after most commands
trim() { head -n "$maxln"; }

# wraps highlight to treat exit code 141 (killed by SIGPIPE) as success
highlight() { command highlight "$@"; test $? = 0 -o $? = 141; }

case "$extension" in
    # Archive extensions: disabled, because lagged with large ones.
#    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
#    rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
#        try als "$path" && { dump | trim; exit 0; }
#        try acat "$path" && { dump | trim; exit 3; }
#        try bsdtar -lf "$path" && { dump | trim; exit 0; }
#        exit 1;;
#    rar)
#        try unrar -p- lt "$path" && { dump | trim; exit 0; } || exit 1;;
    # Documents:
    pdf)
        try pdftotext -l 10 -nopgbrk -q "$path" - && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    odt|ods|odp)
        try odt2txt "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    ppt)
        try catppt "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    docx)
        try docx2txt.pl "$path" - && \
            { dump | trim | fmt -s -w $width; exit 0; }
        try docx2txt.sh "$path" - && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    doc)
        try antiword "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; }
        try catdoc "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } 
            exit 1;;
    1)
        man "$path" && { dump | trim | fmt -s -w $width; exit 5; } || exit 1;;
    xlsx)
        try ssconvert -T Gnumeric_stf:stf_csv "$path" fd://1 && \
            { dump | trim | fmt -s -w $width; exit 0; } 
        try xlsx2cvs "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    xls)
        try xls2txt "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    csv) # csv better formatting
        try column -s, -t < "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    rtf)
        try catdoc "$path" && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    dmp) #quickbms dump files
        #comtype_scan2.bat comtype_scan2.bms LLL.VRL ./comtypetest
        xxd "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        exit 0;;
    mdf)
        try mdf2iso "$path"; exit 0;;
    # Media
    xcf) #not perfect, but works.
    #width=$(( 200+$COLUMNS )); height=$(( 200+$LINES )); xoffset=300; yoffset=15 #additions don't work. def. col. ratio: 1, 3, 4
    #width=200; height=200; xoffset=$(( `tput cols`*5,060240 )); yoffset=10 #works, but small decalage because decimals are not possible. Only scale=0 works.
    width=200; height=200; xoffset=$(echo "scale=0; $(tput cols)*3.06024096/1" | bc); yoffset=10 #works, but 4 instead of 5 is more accurate on smaller widths.Try calling script with case) different widths for optimal decalage.
        xcf2png "$path" -o /tmp/w3mxcf ; convert -size "$width"x"$height" /tmp/w3mxcf -scale "$width"x"$height" "/tmp/w3mxcf2"; echo -e "2;3;\n0;1;"$xoffset";"$yoffset";;;;;;;"/tmp/w3mxcf2"\n4;\n3;" | /usr/lib/w3m/w3mimgdisplay
        exit 0;;
      #  xcf2png "$path" | convert -size "$width"x"$height" - -scale "$width"x"$height" "/tmp/w3mxcf$$"  && echo -e "2;3;\n0;1;"$xoffset";"$yoffset";;;;;;;"/tmp/w3mxcf$$"\n4;\n3;" | /usr/lib/w3m/w3mimgdisplay exit 0;;
    mas)
        wine MASadelic.exe -V -m:`winepath -w "$path"` -f:* | column -c 20
        exit 0;;
    svm)
        wine /home/kv/scgted130721.sh "$path" || exit 0;;
       # Web
    torrent)
        try transmission-show "$path" && { dump | trim; exit 5; } || exit 1;;
       # Regular text files that aren't recognized as such.
    inf)
        less "$path" && { dump | trim; exit 5; } || exit 2;;
    swf)
        try mediainfo "$path" && { dump | trim | sed 's/  \+:/: /;';  exit 5; } || exit 1;;
    htm|html|xhtml)
        try w3m    -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try lynx   -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try elinks -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        ;; # fall back to highlight/cat if the text browsers fail
esac

case "$mimetype" in
    # Syntax highlight for text files:
    text/* | */xml)
       try highlight --out-format=ansi "$path" && { dump | trim; exit 5; } || exit 2;;
    # Ascii-previews of images:
    image/*)
        img2txt --gamma=0.6 --width="$width" "$path" && exit 4 || exit 1;;
    # Display information about media files:
    video/* | audio/*)
        #exiftool "$path" && exit 5
        # Use sed to remove spaces so the output fits into the narrow window
        try mediainfo "$path" && { dump | trim | sed 's/  \+:/: /;';  exit 5; } || exit 1;;
esac

exit 1
