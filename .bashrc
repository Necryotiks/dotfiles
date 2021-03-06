# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
genstub()
{
	source genstub
}
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
export EDITOR=vim
export JAVA_HOME="/usr/libexec/jdk1.8.0_171"
export PATH=$JAVA_HOME/bin:$PATH


parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\033[32;1m\u@\h \033[34m\w\033[31;1m\$(parse_git_branch)\033[34m \$ \033[37;1m"
