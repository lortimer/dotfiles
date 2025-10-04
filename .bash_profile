# Aliases

## History

### for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

### Write to bash_history after each command
export PROMPT_COMMAND='history -a'

## Terminal
alias x='tput reset'
alias ls='ls -a'
alias resource='source ~/.bashrc'
alias bashp='nano ~/.bash_profile'

apt-where(){
   dpkg -L "$1";
}
grepp(){
   grep -A 10 -B 10 "$1";
}

greppp(){
   grep -A 100000 -B 100000 "$1";
}

update(){
   sudo apt update;
   sudo apt upgrade;
   flatpak update;
}

## Git
alias gs='git status'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'
alias gpsf='git push --force-with-lease'
alias ga='git add .'
alias g-='git switch -'
alias grc='git rebase --continue'
gc() {
   git commit -m "$1";
}
gb() {
   git checkout -b $1;
   git push --set-upstream origin $1;
}
gdb() {
   git branch -d "$1";
   git push origin --delete "$1";
}

### Add git branch to command prompt if it is present
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\$ '
