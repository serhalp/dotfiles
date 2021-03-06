# bash history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR='nvim'
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PREFIX=`brew --prefix`
# export RBENV_ROOT=/usr/local/var/rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.sekret ]; then
  source ~/.sekret
else
  echo ".sekret FILE NOT FOUND - skipping!"
fi

# Retrieve securely stored passwords and API keys from keychain
get_secure_goodeggs_value () {
  security find-generic-password -a goodeggs -s $1 -g -w
}

export HOMEBREW_GITHUB_API_TOKEN="$(get_secure_goodeggs_value homebrew_github_api)"
export NPM_AUTH="$(get_secure_goodeggs_value npm)"

eval "$(nodenv init -)"

# NOTE: this should occur after `nodenv init`
# NOTE: keep these in reverse priority order
export PATH="$HOME/.yarn/bin:$PATH" # manually installed `yarn` binary
export PATH="$PATH:`yarn global bin`" # globally installed yarn node module binaries
export PATH="./node_modules/.bin:$PATH" # locally installed node module binaries

export PATH="$HOME/.cargo/bin:$PATH"

export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=$AWS_DEFAULT_REGION

if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
  . ${BREW_PREFIX}/etc/bash_completion
else
  echo "brew bash-completion formula not found - skipping!"
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh

  MAGENTA="\[\033[0;35m\]"
  YELLOW="\[\033[0;33m\]"
  BLUE="\[\033[34m\]"
  LIGHT_GRAY="\[\033[0;37m\]"
  CYAN="\[\033[0;36m\]"
  GREEN="\[\033[0;32m\]"
  RED="\[\033[0;31m\]"
  GIT_PS1_SHOWDIRTYSTATE=true

  export PROMPT_COMMAND=__prompt_command

  function __prompt_command() {
    local EXIT="$?"
    local PROMPT_COLOR=$GREEN
    if [ $EXIT != 0 ]
    then
      PROMPT_COLOR=$RED
    fi

    export PS1='$(
        if [[ $(__git_ps1) =~ \*\)$ ]]
        # a file has been modified but not added
        then echo "'$YELLOW'"$(__git_ps1 "(%s)")
        elif [[ $(__git_ps1) =~ \+\)$ ]]
        # a file has been added, but not commited
        then echo "'$MAGENTA'"$(__git_ps1 "(%s)")
        # the state is clean, changes are commited
        else echo "'$CYAN'"$(__git_ps1 "(%s)")
        fi)'$BLUE" \W "$PROMPT_COLOR"\$ "$LIGHT_GRAY
  }
else
  echo "~/.git-prompt.sh not found - skipping!"
fi

ops() {
  local dir_name=$(echo $1 | sed -E 's/po-/purchase-orders-/; s/f-?o-/fulfillment-options-/')
  cd ~/Projects/ops-super/apps/$dir_name
}

clone() {
  p && git clone git@github.com:goodeggs/$1.git && p $1
}

p() {
  cd ~/Projects/$1
}

source ~/.bash_aliases

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NODE_EXTRA_CA_CERTS="$HOME/Library/Application Support/mkcert/rootCA.pem"

# gnupg doesn't seem to work on OS X without this
export GPG_TTY=$(tty)
