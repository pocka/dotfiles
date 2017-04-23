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
zstyle ":vcs_info:*" formats " ${CH_BRANCH} %b%u%c "
zstyle ":vcs_info:*" actionformats "[%b|%a]"

precmd () { vcs_info }

# Prompt settings
autoload -Uz colors
colors

## Color variables

PROMPT='
%F{233}%K{190} %B%n@%m%b %k%f%F{190}%K{240}${CH_ARROW}%F{231}${vcs_info_msg_0_}%f%k%F{240}%K{235}${CH_ARROW}%f%F{42} %d %k%f%F{235}${CH_ARROW}%f
%# '
POSTEDIT='
'

# Key settings
bindkey -v # Enable vi key bind
