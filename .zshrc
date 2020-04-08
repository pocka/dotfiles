# Options
setopt prompt_subst

# Auto complete
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fpath=(~/.zsh $fpath)
autoload -Uz compinit
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

# My custom prompt
function custom-prompt() {
	echo -e "
%f%k%b${1}%{$fg_bold[white]%} %1d %f%k${vcs_info_msg_0_}%k%f%b
%{$fg_no_bold[white]%}%# "
}

## VCS information stuff
autoload -Uz vcs_info

precmd () { vcs_info }

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "%{$fg_bold[green]%}*%f%b"
zstyle ":vcs_info:git:*" unstagedstr "%{$fg_bold[red]%}*%f%b"
zstyle ":vcs_info:*" formats "%{$fg_bold[white]%}... ${CH_BRANCH} %b%c%u%f"
zstyle ":vcs_info:*" actionformats "[%b|%a]"

function zle-line-init zle-keymap-select {
	case $KEYMAP in
		vicmd)
			PROMPT=$(custom-prompt "%{$fg_bold[black]%}%{$bg[green]%} N %{$fg[green]%}%k${CH_RARROW}%f%b")
			;;
		main|viins)
			PROMPT=$(custom-prompt "%{$fg_bold[black]%}%{$bg[blue]%} I %{$fg[blue]%}%k${CH_RARROW}%f%b")
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
export NVM_DIR="$(realpath $HOME/.nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GPG client setting
export GPG_TTY=$(tty)
