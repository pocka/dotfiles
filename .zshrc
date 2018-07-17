# Options
setopt prompt_subst

# Auto complete
autoload -U compinit
compinit
zstyle ':completion:*' ignored-patterns 'exiv2'

# Prompt settings
autoload -Uz colors
colors

source ~/.zsh/colors.zsh # Load color variables

## Symbol characters
CH_BRANCH=$'\ue0a0'
CH_RARROW=$'\ue0b0'
CH_LARROW=$'\ue0b2'

# Returns dark hexa-background text
function hexbox() {
	echo -e "%f%k%F{white}${CH_LARROW}%f%{$fg_bold[black]%}%K{white} ${1} %f%k%{$fg_no_bold[white]%}${CH_RARROW}%f"
}

# My custom prompt
function custom-prompt() {
	echo -e "
%f%k%b%F{black}%B${1} %b%f$(hexbox "%n@%m")%F{black}%B %~ %b%f${vcs_info_msg_0_}
%{$fg_no_bold[white]%}%# "
}

## VCS information stuff
autoload -Uz vcs_info

precmd () { vcs_info }

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "(staged changes)"
zstyle ":vcs_info:git:*" unstagedstr "(unstaged changes)"
zstyle ":vcs_info:*" formats "$(hexbox "${CH_BRANCH} %b%u%c")"
zstyle ":vcs_info:*" actionformats "[%b|%a]"

function zle-line-init zle-keymap-select {
	case $KEYMAP in
		vicmd)
			PROMPT=$(custom-prompt "NORMAL")
			;;
		main|viins)
			PROMPT=$(custom-prompt "INSERT")
			;;
	esac
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Set ls color
source ~/.zsh/ls_colors.zsh

# Key settings
bindkey -v # Enable vi key bind

# Alias
alias vi='vim'
alias ls='ls -l --color=auto'

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=100000

setopt hist_ignore_dups # Ignore duplicate history
setopt extended_history # Save timestamp

# Tilix config (Fix VTE issue)
if [[ $TILIX_ID ]]; then
	source /etc/profile.d/vte.sh
fi

# Loads NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
