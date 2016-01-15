export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PREFIX=`brew --prefix`
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [[ -x $(which brew) ]]; then
  BREW_NVM_PREFIX=`brew --prefix nvm`
  nvm_path=${BREW_NVM_PREFIX}/nvm.sh
  [[ -f $nvm_path ]] && source $nvm_path
fi

# After nvm sets up the path
export PATH="./node_modules/.bin:$PATH" # locally installed node binaries

# for passwords and stuff:
if [ -f ~/.sekret ]; then
  source ~/.sekret
fi

COMPLETION_DIR=${BREW_PREFIX}/etc/bash_completion.d
if [ -d ${COMPLETION_DIR} ]; then
  for file in `ls ${COMPLETION_DIR}`
  do
    . "${COMPLETION_DIR}/${file}"
  done
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
fi

npmrc_export_auth(){
    # modules' .npmrc files want $NPM_AUTH, so provide it:
    export NPM_AUTH=`cat ~/.npmrc | grep _auth | sed -E 's/_auth ?= ?//'`
}
npmrc(){
  NPM_PROFILE=$1
  if [[ "$NPM_PROFILE" != "" ]]; then
    test -f ~/.npmrcs/$NPM_PROFILE || { echo "No such profile '$NPM_PROFILE'."; return; }
    rm -f ~/.npmrc 2> /dev/null
    ln -s ~/.npmrcs/$NPM_PROFILE ~/.npmrc
    npmrc_export_auth;
    echo "Loaded profile $NPM_PROFILE"
  fi

  ls -al ~/.npmrc
  echo "NPM_AUTH: $NPM_AUTH"
}
# initial
npmrc_export_auth;

source $(brew --prefix nvmish)/nvmish.sh

install_and_shrinkwrap_module(){
  npm install --save $1@$2 && clingwrap $1
}

install_and_shrinkwrap_dev_module(){
  npm install --save-dev $1@$2 && clingwrap $1
}

reshrinkwrap_module(){
  npm uninstall --save $1 && clingwrap $1 && npm prune && npm install && npm install --save $1@$2 && clingwrap $1
}

reshrinkwrap_dev_module(){
  npm uninstall --save-dev $1 && clingwrap $1 && npm prune && npm install && npm install --save-dev $1@$2 && clingwrap $1
}
