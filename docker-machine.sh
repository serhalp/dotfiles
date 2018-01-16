# Create Default Machine setup
# docker-machine create -d parallels default
#

function docker-machine-init
{
  echo 'Setting up a parallels docker machine and attaching all Yubikeys to it'
  docker-machine rm default -f || true
  # Stub for setting parallels # of cores based on machine cores (sysctl -n hw.ncpu)
  docker-machine create -d parallels --parallels-disk-size "122880" --parallels-memory "8192" --parallels-cpu-count -1 --parallels-no-share default

  for a in $(prlsrvctl usb list | grep '^Yubikey' | awk '{print $4;}'); do
    eval "prlsrvctl usb set ${a} default"
  done

  ./docker-machine-nfs.sh default -i
  docker-machine restart default
  eval $(docker-machine env default)
}

function docker-machine-reload
{
  docker-machine restart default
  eval $(docker-machine env default)
}

if [[ "$(uname)" == 'Darwin' ]] && which docker-machine > /dev/null 2>&1 \
&& docker-machine status default > /dev/null 2>&1 ; then

  if [ "$(docker-machine status default)" != 'Running' ]; then
    docker-machine start default
    eval $(docker-machine env default)
  else
    eval $(docker-machine env default)
  fi
fi

function docker-machine-forwards-disable
{
  if [ -f '/tmp/docker-machine-forwards.pid' ]; then
    kill -9 $(cat /tmp/docker-machine-forwards.pid) || true
  fi
}

function docker-machine-forwards
{
  docker-machine-forwards-disable
  setopt shwordsplit
  FORWARDS=""
  PORTS=$(docker ps --format '{{.Ports}}' | grep -oE ':[0-9]*' | sed 's/://g' | xargs)
  echo $PORTS
  for PORT in ${PORTS}; do
    FORWARDS="${FORWARDS} -L${PORT}:localhost:${PORT} "
  done
  unsetopt shwordsplit

  if [ "${DOCKER_MACHINE_NAME}" != "" ]; then
    echo 'Found remote docker host, doing some port forwarding'
    DOCKER_SSH_HOST=$(echo "${DOCKER_HOST}" | sed 's/tcp:\/\///' | sed -e 's/\:[0-9].*$//g')
    SSH_CMD="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -N "${FORWARDS}" -i \"${DOCKER_CERT_PATH}/id_rsa\" \"docker@${DOCKER_SSH_HOST}\""
    eval "${SSH_CMD} &"
    DOCKER_SSH_PID="$!"
    echo $DOCKER_SSH_PID > /tmp/docker-machine-forwards.pid
    echo $SSH_CMD
  fi
}

