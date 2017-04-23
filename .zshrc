# Options
setopt prompt_subst

# Symbol characters
CH_BRANCH=$'\ue0a0'
CH_ARROW=$'\u2b80'

# Auto complete
autoload -U compinit
compinit

# VCS information stuff
autoload -Uz vcs_info

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "%B%F{70}+%f%b"
zstyle ":vcs_info:git:*" unstagedstr "%B%F{124}+%f%b"
zstyle ":vcs_info:*" formats " ${CH_BRANCH} %B%b%u%c "
zstyle ":vcs_info:*" actionformats "[%b|%a]"

precmd () { vcs_info }

# Prompt settings
autoload -Uz colors
colors

source ~/.zsh/colors.zsh

PROMPT=$'
%F{$BLACK}%K{$PINK} %B%n@%m%b %k%f%F{$PINK}%K{$GREEN}${CH_ARROW}%F{$BLACK}${vcs_info_msg_0_}%f%k%F{$GREEN}%K{$GREY}${CH_ARROW}%f%F{$BLACK} %B%d%b %k%f%F{$GREY}${CH_ARROW}%f
%# '

POSTEDIT='
'
## Set ls color
source ~/.zsh/ls_colors.zsh

# Key settings
bindkey -v # Enable vi key bind
