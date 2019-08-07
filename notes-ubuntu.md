# Ubuntu 

## settings
Add the dns search suffixes to the default interface in /etc/network/interfaces
```
iface lo inet loopback
  dns-search umdl.umich.edu umich.edu
```

## gtk css for terminal window
A gtk hack to indicate which terminal is in focus by changing the background and scrollbar.
See: [gtk.css](gtk.css)

## other installs

nbvm-thefuck
`sudo pip install psutil thefuck`

rbenv
```sh
sudo mkdir /l/local
git clone https://github.com/rbenv/rbenv.git /l/local/rbenv

sudo echo 'export PATH="/l/local/rbenv/bin:$PATH"' > /etc/profile.d/rbenv_profile.sh
sudo echo '/l/local/rbenv/bin/rbenv init' >> /etc/profile.d/rbenv_profile.sh
sudo git clone https://github.com/rbenv/ruby-build.git /l/local/rbenv/plugins/ruby-build
sudo chmod -R 0755 /l/local/rbenv
```
## Bashrc additions

### PS1 terminated by a neat unicode char ⇶ ⥈ ⮞ ∫
Use integration symbold because the command line is the _integrated_ development environment.
(◔_◔)
```sh
  parse_pwd(){
    pwd | awk 'BEGIN {FS="/";OFS=""}; {print $(NF-1),"/",$NF}'
  }
  
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }
  PS1='∫ $(parse_pwd) $(parse_git_branch)⮞ '
```

### Replace system bell using pulse audio
Change pulse audio bell intercept to something less annoying.
```sh
# Upload sound of choice
pactl upload-sample /usr/share/cinnamon/sounds/togglekeys-sound-off.ogg mutedbell
# Remove any existing (e.g. default) bell intercepts
pactl unload-module module-x11-bell
# Add bell intercept that plays a nicer tone
pactl load-module module-x11-bell sample=mutedbell
```
### Remap Caps Lock to Esc
Map the caps lock key to escape as a convenience for typing in vim.
```sh
xmodmap ~/.caps_to_esc
```

Where the caps\_to\_esc file contents are as follows:
```
! Remap caps lock to esc for xmodmap
clear Lock
keycode 0x42 = Escape
```
### Aliases
#### Bundler execute
```sh
alias bunx='bundle exec'
```

#### Check the battery power
```sh
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
```

#### Add alias to purge branches that have been merged
```sh
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'
```

#### Open modified files in vim
```sh
alias vimmodified='vim -p `git_mod_files_list`'
```

#### Rapid directory ascension
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
