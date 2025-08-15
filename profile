# bash history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR='nvim'

# homebrew - different setup for Apple Silicon vs. Intel
if [[ $(uname -m) == 'arm64' ]]; then
  # add `brew` cli itself to PATH
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # add packages to PATH
  export PATH="/opt/homebrew:$PATH"
else
  # add `brew` cli itself to PATH
  eval "$(/usr/local/bin/brew shellenv)"
  # add packages to PATH
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PREFIX=`brew --prefix`

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(nodenv init -)"

# Locally installed node module binaries
export PATH="./node_modules/.bin:$PATH"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Go binaries
export PATH="$HOME/go/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
  . ${BREW_PREFIX}/etc/bash_completion
else
  echo "brew bash-completion formula not found - skipping!"
fi

source ~/.git-completion.sh

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


p() {
  cd ~/Projects/$1
}

source ~/.bash_aliases

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# gnupg doesn't seem to work on OS X without this
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/serhalp/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/serhalp/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/serhalp/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/serhalp/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Needed for Go development in some Netlify projects
export CGO_LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix re2)/lib"
export OPENSSL_ROOT_DIR="$(brew --prefix openssl)/lib"
export GOPRIVATE="github.com/netlify/"

. "$HOME/.deno/env"
