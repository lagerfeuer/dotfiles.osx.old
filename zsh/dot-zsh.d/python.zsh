autoload -U add-zsh-hook
load-venv() {
  if [[ -f venv/bin/activate ]]; then
    source venv/bin/activate
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate
  fi
}
add-zsh-hook chpwd load-venv
load-venv

