export GREEN="\[\033[0;32m\]"
export CYAN="\[\033[0;36m\]"
export RED="\[\033[0;31m\]"
export PURPLE="\[\033[0;35m\]"
export BROWN="\[\033[0;33m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
export LIGHT_BLUE="\[\033[1;34m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export LIGHT_CYAN="\[\033[1;36m\]"
export LIGHT_RED="\[\033[1;31m\]"
export LIGHT_PURPLE="\[\033[1;35m\]"
export YELLOW="\[\033[1;33m\]"
export WHITE="\[\033[1;37m\]"
export NO_COLOR="\[\033[0m\]" #0m restores to the terminal's default colour

function prompt_command {
    RET="$?"
    PS1=""

    # Return code
	if [[ $RET != 0 ]]; then
		PS1="${PS1}${RED}[${RET}]${NO_COLOR}"
	else
		PS1="${PS1}${GREEN}[${RET}]${NO_COLOR}"
	fi

	# Current user and host
	PS1="${PS1}${PURPLE}[\u@\h]${NO_COLOR}"

	# Current working dir
	PS1="${PS1}${LIGHT_CYAN}[\w]${NO_COLOR}"

	# Git prompt
	PS1="${PS1}${YELLOW}$(__git_ps1 '[%s]')${NO_COLOR}"

	# Current time
	PS1="${PS1}${LIGHT_GRAY}[\A]${NO_COLOR}"

	# New line
	PS1="${PS1}\n"

	export PS1
}
export PROMPT_COMMAND=prompt_command

GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1