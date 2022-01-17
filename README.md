# Convenience Recreating Dev Machine Setup

Currently built on ubuntu bionic this includes bash rc, system settings, and package selections.

## Use
1. Run `./filluser.sh username` to do a sed substitution for all the places where the username was used.
2. Append bashrc to .bashrc
3. Copy files to home directory
    - dev-tmux.sh
    - Rprofile
    - .caps_to_esc
    - .gitconfig
    - .gitignore_global
    - .vimrc

## Bashrc
The current addendum to stock ~/.bashrc provided by ubuntu.

## pieces.md
Some clever bits of bashrc split out with some explanation.

## packages-ubuntu
Repo and package selections for current system.  
Serves as a refernce for:

- "where the heck was I pulling that package from?" 
- "What was the name of that package I was using for this thing?"

## dev-tmux.sh
An example of how to have a project startup script with tmux.

## Rprofile
From `~/.Rprofile` that automatically loads devtools for interactive sessions
