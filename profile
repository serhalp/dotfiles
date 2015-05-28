export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PREFIX=`brew --prefix`

if [[ -x $(which brew) ]]; then
  nvm_path="$(brew --prefix nvm)/nvm.sh"
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
