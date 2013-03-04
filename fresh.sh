#!/bin/bash
ver="130202" #Installs my apps on fresh Arch. 
# install arch + login as root + pacman -Syu + execute: wget www.tiny.cc/freshy; chmod +x; freshy
# upload to www.paste.ee and get to VM using wget
# TODO: detect if VM/USB > vone/uone
# - have to be installed before executing: wget, vim (but rm vim dependency)
# - remove `alsamixer`, raise volume in the background.
# pacstrap -i for interactive. Default base + base-devel doesn't fit is > 900MB
# ===== config =====
user="kv"
hostname="kone"
me=$(basename $0)

# ===== cli ===== #capitals are AUR
a="vim bash-completion ranger htop tmux aspell e3 
atool bzip2 unzip p7zip unrar highlight
profont ttf-freefont ttf-liberation ttf-dejavu"
A="redshift-minimal google-translate ttf-dotsies otf-ipafont ttf-tibetan-machine xorg-xfontsel"
c="nmon iotop testdisk powertop ncdu colordiff fbgrab arch-install-scripts"
C="cdu cmospwd"
e="antiword wyrd calcurse"
m="alsa-utils abcde"
M="herrie podget"
o="irssi bitlbee mutt"
p="fbv optipng imagemagick ghostscript librsvg jasper"
P="pngquant"
w="wget curl axel w3m links lynx elinks rtorrent newsbeuter
vnstat aircrack-ng tcpdump nmap"
v="dvdbackup"
z="cowsay cmatrix bsd-games fortune-mod
libcaca aalib"
Z="screenfetch asciiquarium"
# ===== X light =====
la="xclip hsetroot gparted pcmanfm hardinfo cups cups-filters cups-pdf"
lA="xarchiver"
le="zathura zathura-pdf-poppler zathura-djvu zathura-ps"
lp="sxiv feh"
lP="xoris meh"
lw="dwb surf wicd"
lv="mplayer2 youtube-viewer"
lV="gcap"
# ===== X heavy =====
he="libreoffice gnumeric abiword"
hE="focuswriter"
hm="audacity lmms ardour jack hydrogen gtkpod"
hM="rakarrack"
ho="scantailor"
hp="gimp darktable hugin inkscape mypaint"
hw="firefox"
hv="kdenlive"
hV="slowmovideo-git"
hZ="wine rejoystick"
ugly="flashplugin "

# ===== don't touch =====
r='\e[0;31m' g='\e[0;32m' x='\e[0m' R='\e[1;31m' G='\e[1;32m' ok="\t${G}OK${x} "
time=":: ${y}`date +%r`${x}" #shows time [:: ${y}`date +%r`${x}] => 12:59:59 PM
base="$a $A $xa $xA"
all="$a $c $e $m $o $p $w $v $z"
ALL="$A $C $E $M $O $P $W $V $Z"
lall="$la $lc $le $lm $lo $lp $lw $lv $lz"
lALL="$lA $lC $lE $lM $lO $lP $lW $lV $lZ"
hall="$ha $hc $he $hm $ho $hp $hw $hv $hz"
hALL="$hA $hC $hE $hM $hO $hP $hW $hV $hZ"

# ===== 0 ===== # general if's
#exit upon error: http://www.davidpashley.com/articles/writing-robust-shell-scripts.html
set -o errexit 						
trap 'echo -e "\n${r}Aborted${x}"; exit' INT	 	#so that CTRL-C kills

if [[ $1 == -v ]]; then
  echo -e "freshy $ver"
  exit 1; fi

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
  vim /etc/locale.gen
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
  pacman -S --needed syslinux sudo bash-completion dialog wpa_supplicant vim
  syslinux-install_update -i -a -m
  vim /boot/syslinux/syslinux.cfg
  visudo
  echo "blacklist pcspkr" > /etc/modprobe.d/nobeeep.conf
  pacman -S alsa-utils
  alsamixer
  mv ${0} /home/$user/$me
  echo -e "\nbeep disabled: done!" 
  echo -e "[archlinuxfr]\nServer = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf; pacman -Sy yaourt
  echo -e "\nyaourt installed: done!" 
  echo -e "script moved to /home/$user/$me !" 
  echo "now exit, umount /mnt/, and reboot."
  exit; fi

if [[ $1 == -post ]]; then
if [[ ! $EUID -ne 0 ]]; then 				#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
    sudo pacman -S --needed git
    echo -e "\ngetting dots!\n"
    git clone https://github.com/octos/d.git
    cd ~/d; chmod +x ~/d/dots.sh; ~/d/dots.sh
    fi

if [[ $1 == -apps ]]; then
if [[ ! $EUID -ne 0 ]]; then 				#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
  echo "WHAT DO YOU WANT TO INSTALL?"
  sudo pacman -S --needed $all $lall
  yaourt -S $All $lAll
  exit
fi

if [[ $1 == -x ]]; then
if [[ ! $EUID -ne 0 ]]; then   			#superuser?
  echo "Don't run as root!" 1>&2; exit 1; fi
  sudo pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils
  sudo pacman -S xf86-video-intel

  echo -e "\nnow time for dwm!\n"
  sudo pacman -S --needed abs dmenu dunst libnotify unclutter slock rxvt-unicode xterm
  sudo abs community/dwm
  mkdir -p ~/d/dwm
  cp -r /var/abs/community/dwm ~/d/dwm
  cd ~/d/dwm  
  makepkg -i
  echo "if octos/d not set up, do:"
  echo "echo "exec dwm" >> ~/.xinitrc"
  echo -e "\n if in VirtualBox,"
  echo -e "# pacman -S virtualbox-guest-utils"
  echo -e "# modprobe -a vboxguest vboxsf vboxvideo"
  exit
fi


# ===== 1 ===== # post-installation stuff
# RANKMIRRORS (disabled)
#pacman -Syyu curl
#cd /etc/pacman.d
#cp mirrorlist mirrorlist.backup
#nano mirrorlist.backup
#rankmirrors -n 6 mirrorlist.backup > mirrorlist
#pacman -Syy


# ===== 2 =====
#echo -e "\n${G}Installing nn programs${x}"
#sudo $pkgman $do $all
#echo ${arr[$rand]}
exit 1

# See also: InstallingArch-2012
# LnF 2011 https://bbs.archlinux.org/viewtopic.php?id=111878

# ===== TODO =====
#My suggestion is to add:
#Dexter  simple address book
#Postler lightweight mail application 
#DeaDBeeF for music player it is lightweight

# === Dependencies ===
# pacman
# ===== ASSUMPTIONS =====
# - Arch Linux
# - internet connection
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
