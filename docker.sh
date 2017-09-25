#!/bin/bash
cmd=$1
project=${PWD##*/}


##  FX UTILITY
  if [[ ${cmd} = "push" ]]; then
    dex push
    exit
  elif [[ ${cmd} = "stop" ]]; then
    docker stop fx-${project}
    exit
  elif [[ ${cmd} = "login" ]]; then
    docker exec -it fx-${project} /bin/bash
    exit
  elif [[ ${cmd} = "export" ]]; then
    echo Export Container fx-${project} to local/fx-${project}.tar
    docker export fx-${project} -o ../local/fx-${project}.tar
    exit
  elif [[ ${cmd} = "save" ]]; then
    echo Save Image ${project} to local/${project}.tar
    docker save ${project} -o ../local/${project}.tar
    exit
  fi
##
##
  docker rm fx-${project}
  docker run -it --name fx-${project} \
    -e HUBOT_CHATWORK_TOKEN=$CHATWORK_KEY \
    -e HUBOT_CHATWORK_ROOMS=$CHATWORK_ROOMS \
    -e HUBOT_CHATWORK_API_RATE="500" \
    -e DOCOMO_DIALOGUE_KEY=$DOCOMO_DIALOGUE_KEY \
    -e DOCOMO_QA_KEY=$DOCOMO_QA_KEY \
    -e DOCOMO_ANALYTICS_KEY=$DOCOMO_ANALYTICS_KEY \
    -e RECRUIT_PROOF_KEY=$RECRUIT_PROOF_KEY \
    -e RECRUIT_SEARCH_KEY=$RECRUIT_SEARCH_KEY \
    -e RECRUIT_DIALOG_KEY=$RECRUIT_DIALOG_KEY \
    -v fx-hubot:/home/docker \
    -v $HOME/hubot-project:/home/docker/hubot-project \
    m0kimura/${project}
##
