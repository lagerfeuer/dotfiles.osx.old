alias ls='exa'
alias cat='bat'
# alias grep='rg'
# alias find='fd'
alias readme='glow -p README.md'
alias vale-default='vale --config=$HOME/.vale.ini'

function validate-yaml {
  local readonly YAMLFILE="${1}"
  ruby -ryaml -e "p YAML.load(STDIN.read)" < ${YAMLFILE}
}

function shellcheck-buildspec {
  local readonly BUILDSPECS="${@}"
  for spec in "${BUILDSPECS[@]}"; do
    echo "$(tput setaf 2)$(tput bold)[+] ${spec}$(tput sgr0)"
    yq e '.phases.[].commands.[]' "${spec}" | shellcheck --exclude=SC2148 -
  done
}

alias dotenv='set -o allexport; source .env; set +o allexport'

# PATHS
alias infra-live='$HOME/Work/infrastructure-live'
alias infra-modules='$HOME/Work/infrastructure-modules'

