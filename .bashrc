# detect window resizing
shopt -s checkwinsize


#####################
# ENVIRONMENT
#

# ls coloured output: see 'man ls' for explanation
export LSCOLORS="ExFxCxDxBxegedabagacad"

# of course
export EDITOR="vim"

# I'm giving this a try.
set -o vi


#####################
# HISTORY

# no duplicates in history, and ignore commands starting with a space
export HISTCONTROL="erasedups:ignoreboth"

# timestamps in history
export HISTTIMEFORMAT="%F %T "

# keep loads of history
export HISTSIZE=5000
export HISTFILESISZE=$HISTSIZE

# don't bother storing some stuff in history
export HISTIGNORE="ls"

# Do not grep .svn directories.
# -I suppresses annoying messages about binary files.
# --exclude-dir depends on grep >= 2.5.3
# All older versions suck. TODO: Maybe put in a version test?
export GREP_OPTIONS=" -I --exclude-dir=.svn"


#####################
# PROMPT
#

# coloured prompt and titlebar info
TITLEBAR='\[\e]2;\h:\w\a\]'
BASE_PS1="\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[0;36m\]\w\[\033[0m\]\$ "

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

# hex dumping
alias hd='hexdump -C'

# nice sqlite output
alias sqlite3='sqlite3 -header -column'

# readline stuff for netcat
alias nc='rlwrap nc'

# don't let vim try to connect to X server - it can slow the startup
alias vim='vim -X'


#####################
# FUNCTIONS
#

# reset the ssh auth sock so agent continues to work
sshsock()
{
	export SSH_AUTH_SOCK=$(find /tmp/ssh-*/ -user $USER -name agent.* 2>/dev/null)
}
