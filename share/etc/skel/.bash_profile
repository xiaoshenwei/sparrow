# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# the rest of this file is commented out.

#[ "x$SHLVL" = "x1" ] && FLAG_LOGINSHELL=true # in a login shell
#[ "x$DISPLAY" != "x" ] && FLAG_XTERM=true # in X
#[[ `tty` == /dev/pts/[0-9]* ]] && FLAG_CONSOLE=true # in console

export PATH=/sbin:/usr/sbin:"${PATH}"

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
#if [ -d ~/man ]; then
#    MANPATH=~/man:"${MANPATH}"
#    export MANPATH
#fi

# # Remove the temp symlink from previous logins
# rm -rf /tmp/ssh-agent-sock-screen
# 
# # Link /tmp/ssh-agent-sock-screen to $SSH_AUTH_SOCK, which should be the socket
# # for an active, running ssh-agent
# ln -s  $SSH_AUTH_SOCK /tmp/ssh-agent-sock-screen

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


