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
CH_BRANCH=$'\uf418'
CH_RTRI=$'\ue0b0'
CH_LOCATION=$'\uf450'
CH_DOT=$'\uf444'
CH_PERSON=$'\uf415'
CH_PEN=$'\uf448'
CH_ZAP=$'\u26a1'
CH_FILE=$'\uf15b'

# My custom prompt
function custom-prompt() {
	echo -e "
%f%k%b%F{white}%K{8} ${1} ${CH_DOT}  %F{green}${CH_PERSON}%F{white}  %n@%m ${CH_DOT}  %F{blue}${CH_LOCATION}%F{white}  %~ ${vcs_info_msg_0_} %F{8}%k${CH_RTRI}%f
%{$fg_no_bold[white]%}%# "
}

## VCS information stuff
autoload -Uz vcs_info

precmd () { vcs_info }

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "%F{green}${CH_FILE}%F{white}"
zstyle ":vcs_info:git:*" unstagedstr "%F{red}${CH_FILE}%F{white}"
zstyle ":vcs_info:*" formats "${CH_DOT}  %F{yellow}${CH_BRANCH}%F{white}  %b %c%u "
zstyle ":vcs_info:*" actionformats "[%b|%a]"

function zle-line-init zle-keymap-select {
	case $KEYMAP in
		vicmd)
			PROMPT=$(custom-prompt "%F{1}${CH_ZAP}%F{7} NORMAL")
			;;
		main|viins)
			PROMPT=$(custom-prompt "%F{1}${CH_PEN}%F{7}  INSERT")
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
