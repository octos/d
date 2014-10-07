#!/bin/bash
ver=140115 # automates Arch setup after partitioning,pacstrap,genfstab,arch-chroot
# simply: login + wget www.tiny.cc/freshy; chmod +x; freshy
# pacstrap -i for interactive. base + base-devel > 900MB

# ===== config =====
user="kv"
hostname="klex"
me=$(basename $0)

# ===== cli ===== #capitals are AUR
a="vim urxvt-perls bash-completion ranger libnotify htop tmux aspell e3 
atool bzip2 unzip p7zip unrar highlight mediainfo odt2txt
reflector profont ttf-freefont ttf-liberation ttf-dejavu xorg-xfontsel wmname"
A="redshift-minimal interrobang-git keynav iocane pacnanny google-translate ttf-dotsies docx2txt xls2txt xlsx2csv xcftools"
c="nmon iotop testdisk powertop ncdu colordiff fbgrab arch-install-scripts mdf2iso xdotool"
C="cdu cmospwd photorecover"
e="sane txt2tags antiword catdoc libots wyrd calcurse python2-rst2pdf dos2unix"
E="justext jfbpdf" #pdfsizeopt-cvs
m="alsa-utils mpd ncmpcpp abcde mp3gain"
M="podget"
o="irssi bitlbee mutt abook"
p="fbida fbv optipng imagemagick ghostscript librsvg jasper perl-image-exiftool"
P="pngquant img2pdf-git"
w="wget curl axel w3m links lynx elinks surfraw rtorrent transmission-cli newsbeuter
vnstat aircrack-ng tcpdump nmap python-pip"
W="esniper"
v="dvdbackup"
V="ffcast"
z="cowsay ponysay cmatrix bsd-games fortune-mod screenfetch typespeed gtypist
libcaca aalib"
Z="nyancat-git asciiquarium tbclock bb"
# ===== X light =====
la="xclip hsetroot gparted pcmanfm hardinfo cups cups-filters cups-pdf"
le="zathura zathura-pdf-poppler zathura-djvu zathura-ps typecatcher"
lm="easytag"
lp="sxiv"
lP="xoris imageenlarger" #imageenlarger=SmillaEnlarger
lw="dwb surf wicd"
lv="mpv youtube-viewer"
lV="gcap"
# ===== X heavy =====
he="libreoffice gnumeric abiword"
hm="audacity lmms ardour jack hydrogen gtkpod"
hM="rakarrack"
ho="scantailor"
hp="gimp darktable hugin inkscape mypaint"
hw="firefox emerillon"
hv="kdenlive"
hV="slowmovideo-git makemkv tunesviewer"
hz="wine"
hZ="rejoystick"
# ===== special =====
font="ttf-tibetan-machine otf-ipafont"
ugly="flashplugin"
comp="mplayer2 feh pandoc"
COMP="xarchiver"

# ===== don't touch =====
k='\e[0;37m' r='\e[0;31m' g='\e[0;32m' y='\e[0;33m' b='\e[0;34m' u='\e[0;35m' x='\e[0m' R='\e[1;31m' G='\e[1;32m' ok="\t${G}OK${x} "
time=":: ${y}`date +%r`${x}" #shows time [:: ${y}`date +%r`${x}] => 12:59:59 PM
all="$a $c $e $m $o $p $w $v"
ALL="$A $C $E $M $O $P $W $V"
lall="$la $lc $le $lm $lo $lp $lw $lv"
lALL="$lA $lC $lE $lM $lO $lP $lW $lV"
hall="$ha $hc $he $hm $ho $hp $hw $hv"
hALL="$hA $hC $hE $hM $hO $hP $hW $hV"

# ===== 0 ===== # general if's
#exit upon error: http://www.davidpashley.com/articles/writing-robust-shell-scripts.html
set -o errexit 						
trap 'echo -e "\n${r}Aborted${x}"; exit' INT	 	#so that CTRL-C kills

if [[ $1 == ""  ]]; then
  echo -e "freshy $ver"
  echo "options:
   -install basic install
   -apps    install pacman apps
   -aur     install aur apps
   -dots    dotfiles
   -x       install X
   -v       version
   -z       clean up, start over"
    exit; fi

if [[ $1 == -z ]]; then
 if [[ $EUID -ne 0 ]]; then   			#superuser?
   echo "Must be root to delete user!" 1>&2; exit 1; fi
  userdel $user
  rm -rf /home/$user
  rm /etc/localtime
  echo -e "$user deleted!"
  exit 1; fi

  if [[ $1 == -install ]]; then
  if [[ $EUID -ne 0 ]]; then 				#superuser?
   echo "Run as root!" 1>&2; exit 1; fi
  #vim +154 /etc/locale.gen #old, manual way.
  echo -e "\n Create 512M swap file?"
  read -a userinput
  case $userinput in
  n*|N*) echo -e "skipped.\n";;
  *)  fallocate -l 512M /swapfile
      chmod 600 /swapfile
      mkswap /swapfile
      swapon /swapfile ;;
  esac

  sed -i '/^#en_US.UTF-8/s/^ *#*//' /etc/locale.gen
  locale-gen
  echo LANG=en_US.UTF-8 > /etc/locale.conf
  export LANG=en_US.UTF-8
  echo KEYMAP=us-acentos > /etc/vconsole.conf
  echo FONT=Lat2-Terminus16 >> /etc/vconsole.conf
  ln -s /usr/share/zoneinfo/Canada/Eastern /etc/localtime
  hwclock --systohc --utc
  echo $hostname > /etc/hostname
  passwd
  useradd -m -g users -G audio,lp,storage,video,games,wheel,power,scanner -s /bin/bash $user
  passwd $user
  pacman -S --needed --noconfirm syslinux sudo bash-completion dialog wpa_supplicant vim
  syslinux-install_update -i -a -m
  vim +53 /boot/syslinux/syslinux.cfg
  visudo
  echo "blacklist pcspkr" > /etc/modprobe.d/nobeeep.conf
  pacman -S --noconfirm alsa-utils
  amixer sset Master unmute
  mv ${0} /home/$user/$me
  echo -e "\nswap should work; if not, add this to /etc/fstab:\n "/swapfile none swap defaults 0 0""
  echo -e "\nbeep disabled: done!" 
  echo -e "[archlinuxfr]\nSigLevel = Optional TrustAll\nServer = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf; pacman -Sy --noconfirm yaourt
  echo -e "\nyaourt installed: done!" 
  echo -e "script moved to /home/$user/$me !" 
  echo "now exit, umount /mnt/, and reboot."
  exit; fi

if [[ $1 == -dots ]]; then
if [[ ! $EUID -ne 0 ]]; then 				#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
    sudo pacman -S --needed --noconfirm git
    echo -e "\ngetting dots!\n"
    git clone https://github.com/octos/d.git
    cd ~/d; chmod +x ~/d/dots.sh; ~/d/dots.sh
    fi

if [[ $1 == -apps ]]; then
 if [[ ! $EUID -ne 0 ]]; then 				#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
  echo "What do you want to install? "
  echo -e "${g}all${x}  a,c,e,m,o,p,w,v,z\n    "${k}$all${x}""
  echo -e "${y}lall${x} la,lc,le,lm,lo,lp,lw,lv,lz\n     "${k}$lall${x}""
  echo -e "${u}hall${x} ha,hc,he,hm,ho,hp,hw,hv,hz\n    "${k}$hall${x}""
  echo -e "${u}font${x} $font"
  echo -e "${u}ugly${x} $ugly"
  echo -e "${u}comp${x} $comp"
  echo -e "\nfor AUR apps, use the -aur option instead"
  read -a userinput
  result=$(for x in ${userinput[@]}; do echo ${!x}; done) #supports multiple-word input
  sudo pacman -S --needed --noconfirm $result    #don't run as root. --needed is broken.
  exit
elif [[ $1 == -aur ]]; then
  if [[ ! $EUID -ne 0 ]]; then 				#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
  echo "What do you want to install? "
  echo -e "${g}ALL${x}  A,C,E,M,O,P,W,V,Z\n    "${k}$ALL${x}""
  echo -e "${y}lALL${x} lA,lC,lE,lM,lO,lP,lW,lV,lZ\n    "${k}$lALL${x}""
  echo -e "${u}hALL${x} hA,hC,hE,hM,hO,hP,hW,hV,hZ\n    "${k}${k}$hALL${x}""
  echo -e "${u}COMP${x} $COMP"
  echo -e "\nfor pacman apps, use the -apps option instead"
  read -a userinput
  result=$(for x in ${userinput[@]}; do echo ${!x}; done) #supports multiple-word input
  yaourt -S --needed --noconfirm $result    #don't run as root. --needed is broken.
  exit
fi

if [[ $1 == -x ]]; then
if [[ ! $EUID -ne 0 ]]; then   			#superuser?
 echo "Don't run as root!" 1>&2; exit 1; fi
 echo -e "Installing X server.."
   sudo pacman -S --needed xorg-server xorg-xinit xorg-utils xorg-server-utils
 echo -e "Installing vesa+mesa+Intel+ATI+Nvidia drivers.."
   sudo pacman -S --needed xf86-video-vesa mesa xf86-video-intel xf86-video-ati xf86-video-nouveau xf86-video-nv
 echo -e "\nnow time for dwm!\n"
#  sudo pacman -S --needed abs dmenu dunst libnotify unclutter slock rxvt-unicode xterm
#  sudo abs community/dwm
#  mkdir -p ~/d/dwm
#  cp -r /var/abs/community/dwm ~/d/dwm
#  cd ~/d/dwm  
#  makepkg -i
echo -e "if octos/d not set up, do:\n echo \"exec dwm\" >> ~/.xinitrc\n"
echo -e "\n Make X work in VirtualBox? (Y/n)"
  read -a userinput
  case $userinput in
  n*|N*) echo -e "skipped.\n";;
  *) echo "sudo pacman -S --needed virtualbox-guest-utils"
           sudo pacman -S --needed virtualbox-guest-utils
     echo -e "\nin case of VBox error, type:\n# modprobe -a vboxguest vboxsf vboxvideo\n"
           #sudo modprobe -a vboxguest vboxsf vboxvideo #"No such device" on kone
           ;;
   esac

echo -e "\n Setup vnStat daemon, for network stats? (Y/n)"
  read -a userinput
  case $userinput in
  n*|N*) echo -e "skipped.\n";;
  *) echo "sudo pacman -S --needed vnstat"
           sudo pacman -S --needed vnstat
           ;;
  esac
           echo -e "\npick network interface to log: (or ENTER to ignore)\n `ls /sys/class/net`"
               read -a userinput
               case $userinput in
               "") echo -e "skipped.\n";;
               *) echo "done: sudo vnstat -u -i $userinput"
                  echo "info: http://ddg.gg/?q=!arch%20vnStat"
                  sudo vnstat -u -i $userinput 
                  ;;
               esac
  exit
fi
exit 1

# TODO Replace archlinuxfr by makepkg
# LnF 2011 https://bbs.archlinux.org/viewtopic.php?id=111878
# ===== Dependencies =====
# - Arch Linux (pacman)
# - internet connection
# - yaourt
# ===== HELP =====
# name of, and path to the script itself
# http://stackoverflow.com/questions/192319/in-the-bash-script-how-do-i-know-the-script-file-name
# tips for better script
# http://www.davidpashley.com/articles/writing-robust-shell-scripts.html
# sed tutorial
# http://jasonpowers.net/tuts.php
# sed info
# http://www.programmingforums.org/post132374.html
# general bash info
# http://linuxconfig.org/Bash_scripting_Tutorial
# 
# http://stackoverflow.com/questions/7376058/how-to-use-or-within-negative-bash-conditions
## EOF ##
