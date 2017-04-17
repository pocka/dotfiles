# Options
setopt prompt_subst

# Auto complete
autoload -U compinit
compinit

# VCS information stuff
autoload -Uz vcs_info

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr " %F{green}[Staged]%f"
zstyle ":vcs_info:git:*" unstagedstr " %F{magenta}[Unstaged]%f"
zstyle ":vcs_info:*" formats ":%b%c%u"
zstyle ":vcs_info:*" actionformats "[%b|%a]"

precmd () { vcs_info }

# Prompt settings
autoload -Uz colors
colors

PROMPT='%{$fg[yellow]%}[%n@%m]%{${reset_color}%} %d${vcs_info_msg_0_}
%# '

# Key settings
bindkey -v # Enable vim key bind
