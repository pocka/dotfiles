# Options
setopt prompt_subst

# Symbol characters
CH_BRANCH=$'\ue0a0'
CH_RARROW=$'\u2b80'
CH_LARROW=$'\u2b82'

# Auto complete
autoload -U compinit
compinit

# VCS information stuff
autoload -Uz vcs_info

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "%F{$GREEN}"
zstyle ":vcs_info:git:*" unstagedstr "%F{$PINK}"
zstyle ":vcs_info:*" formats "%F{$BLACK}%c%u ${CH_BRANCH}%f%F{$BLACK} %B%b "
zstyle ":vcs_info:*" actionformats "[%b|%a]"

precmd () { vcs_info }

# Prompt settings
autoload -Uz colors
colors

source ~/.zsh/colors.zsh

PROMPT_NORMAL=$'
%F{$WHITE}%K{$PINK}%B NORMAL %b%f%k%F{$WHITE}%K{$PINK}${CH_LARROW}%f%k%F{$GREEN}%K{$WHITE}${CH_LARROW}%f%k%F{$BLACK}%K{$GREEN} %B%n@%m%b %k%f%F{$GREEN}%K{$WHITE}${CH_RARROW}%F{$BLACK}${vcs_info_msg_0_}%f%k%F{$WHITE}%K{$GREY}${CH_RARROW}%f%F{$BLACK} %B%d%b %k%f%F{$GREY}${CH_RARROW}%f
%# '

PROMPT_INSERT=$'
%F{$WHITE}%K{$CYAN}%B INSERT %b%f%k%F{$WHITE}%K{$CYAN}${CH_LARROW}%f%k%F{$GREEN}%K{$WHITE}${CH_LARROW}%f%k%F{$BLACK}%K{$GREEN} %B%n@%m%b %k%f%F{$GREEN}%K{$WHITE}${CH_RARROW}%F{$BLACK}${vcs_info_msg_0_}%f%k%F{$WHITE}%K{$GREY}${CH_RARROW}%f%F{$BLACK} %B%d%b %k%f%F{$GREY}${CH_RARROW}%f
%# '

function zle-line-init zle-keymap-select {
	case $KEYMAP in
		vicmd)
			PROMPT=$PROMPT_NORMAL
			;;
		main|viins)
			PROMPT=$PROMPT_INSERT
			;;
	esac
	zle reset-prompt
}

POSTEDIT='
'

zle -N zle-line-init
zle -N zle-keymap-select
## Set ls color
source ~/.zsh/ls_colors.zsh

# Key settings
bindkey -v # Enable vi key bind
