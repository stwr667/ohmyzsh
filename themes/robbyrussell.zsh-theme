function get_forge_env() {
  if [[ "$PWD" =~ "packages/forge-app" ]]; then
    if [ "$FORGE_GRAPHQL_GATEWAY" = "https://api-private.stg.atlassian.com/graphql" ]; then
      forge_env_tmp=stag
    fi
    if [ "$FORGE_GRAPHQL_GATEWAY" = "https://api.atlassian.com/graphql" ]; then
      forge_env_tmp=prod
    fi
    if [[ "$PWD" =~ "automation-forge-example" ]]; then
      forge_app_name=exam
    elif [[ "$PWD" =~ "automation-for-confluence" ]]; then
      forge_app_name=a4c
    else
      forge_app_name=?app
    fi

    echo " forge:$forge_app_name:$forge_env_tmp"
  else
    return
  fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%}'
PROMPT+='%{$fg[yellow]%}$(get_forge_env)%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
