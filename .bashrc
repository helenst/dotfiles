# detect window resizing
shopt -s checkwinsize


#####################
# ENVIRONMENT
#

# ls coloured output: see 'man ls' for explanation
export LSCOLORS="ExFxCxDxBxegedabagacad"

# of course
export EDITOR="vim"

export PATH="$PATH:$HOME/usr/bin"


#####################
# HISTORY

# no duplicates in history, and ignore commands starting with a space
export HISTCONTROL="erasedups:ignoreboth"

# timestamps in history
export HISTTIMEFORMAT="%F %T "

# keep loads of history
export HISTSIZE=50000
export HISTFILESISZE=$HISTSIZE

# don't bother storing some stuff in history
export HISTIGNORE="ls"

# -I suppresses annoying messages about binary files.
alias grep="grep -I --color=auto"


#####################
# PROMPT
#

# coloured prompt and titlebar info
TITLEBAR='\[\e]2;\h:\w\a\]'
BASE_PS1="\[\033[0;32m\]\u@\H\[\033[0m\]:\[\033[0;36m\]\w\[\033[0m\]\$ "

if [ "$TERM" = "linux" ]; then
    PS1="${BASE_PS1}"
else
    PS1="${TITLEBAR}${BASE_PS1}"
fi


#####################
# ALIASES
#

# convenient ls stuff
alias ls='ls --color=auto'
alias ll='ls -l'
alias lal='ls -al'
alias ltr='ls -ltr'
alias nose='nosetests'

# hex dumping
alias hd='hexdump -C'

# nice sqlite output
alias sqlite3='sqlite3 -header -column'

# readline stuff for netcat
alias nc='rlwrap nc'

# don't let vim try to connect to X server - it can slow the startup
alias vim='vim -X'

alias git-svn='git svn'

# I am this good at typing.
alias got='git'
alias gut='git'
alias gti='git'


#####################
# FUNCTIONS
#

# Reset the SSH auth socket so that public key auth can continue to be passed on to remote ssh connections.
# This is useful when reattaching to a screen session - the ssh auth sock has changed, but the shell is old
# so won't have picked up on it.
sshsock()
{
    export SSH_AUTH_SOCK=$(find /tmp/ssh-*/ -type s -printf '%T@ %p\n' -user $USER  | sort -n | tail -1 | cut -f2- -d" ")
}

#
#
replace()
{
	grep -rl "$1" * | xargs sed -i "s/$1/$2/"
}

# Run an SMTP debug server on localhost
smtpdebug()
{
    sudo python -m smtpd -n -c DebuggingServer localhost:25
}

# Run Python http server in current directory
# (takes args, e.g. `pyhttp 9000` to run on port 9000)
pyhttp()
{
#    python2 -m SimpleHTTPServer $@
    python3 -m http.server $@
}

# delete swp files, useful if vim crashes
rmswp() {
    find . -name "*.swp" | xargs rm
}

# delete pyc files
rmpyc() {
    find . -name "*.pyc" | xargs rm
    find . -name "__pycache__" | xargs rm -r
}

# Notify me when tests pass or fail
test_notify() {
	# Run whatever command is passed in
	"$@"

	# Notify with the result
	if [ $? -eq 0 ]
	then
		notify-send "Tests passed" -i '/usr/share/icons/gnome/48x48/emotes/face-smile.png' -t 5000
	else
		notify-send "Tests failed" -i '/usr/share/icons/gnome/48x48/emotes/face-crying.png' -t 5000
	fi
}


export PYTHONSTARTUP=$HOME/.pythonrc

# Virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
