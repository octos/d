clone: `env GIT_SSL_NO_VERIFY=true` as a prefix to git bypasses lack of ca-cerficates.

    git clone https://github.com/octos/d.git
    cd ~/d; chmod +x dots.sh; ./dots.sh

push:

    git config --global user.name "github username"
    git config --global user.email "github email"
    git config --global credential.helper cache
    git pull  # Pulls latest versions
    git add file.ext  # Adds a new file to the repo
    git commit -m "comment"
    git push origin master

#OS X - homebrew
- vifm
- youtube-dl
- mpv --with-bundle
- ffmpeg --with-faac
- imagemagick
- gcc
- Caskroom/cask/xquartz
- Caskroom/cask/imageoptim
- redshift
- aria2
- go
- sox
- brew install Caskroom/cask/nosleep
- gifsicle
- hugo
- mediainfo
- unrar
- brew install Caskroom/cask/gnucash
- flac
- id3ed
- brew install homebrew/x11/gimp
- brew install homebrew/games/myman
- xmlstarlet
- html-xml-utils
- wget
- gpg
- macvim
- fzf
- mpd (To have launchd start mpd at login:
  mkdir -p ~/Library/LaunchAgents
  ln -sfv /usr/local/opt/mpd/*.plist ~/Library/LaunchAgents
Then to load mpd now:
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mpd.plist
Or, if you don't want/need launchctl, you can just run:
  mpd)
- ncmpcpp
- ttyrec
- brew install https://raw.githubusercontent.com/icholy/ttygif/master/ttygif.rb
- XPDF (for PDF2TEXT)
- brew install Caskroom/cask/alarm-clock
- blueutil
- pzip
