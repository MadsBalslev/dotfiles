NEWLINE=$'\n'

PROMPT="%(?:%{$fg_bold[green]%}$HOST_NAME:%{$fg_bold[red]%}$HOST_NAME:)"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info) %{$fg[white]%}${NEWLINE}🤖 > '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

