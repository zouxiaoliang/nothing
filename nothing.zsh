#!/usr/bin/env zsh

NT_PROMPT_SYMBOL='[✡]'

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst

  local current_dir='%F{gray}%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}%f'

  if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='%F{red}#%f'
  else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='%F{gray}$%f'
  fi

  prefix='%(?.%F{green}${NT_PROMPT_SYMBOL}%f.%F{red}${NT_PROMPT_SYMBOL}%f)'
  PROMPT="${prefix}${user_symbol} ${current_dir} "

  if [[ "$NT_HIDE_EXIT_CODE" == '1' ]]; then
  	RPROMPT=''
  else
  	RPROMPT='%(?..%F{red}%B%S  $?  %s%b%f)'
  fi
  
}

