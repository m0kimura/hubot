#!/bin/bash
##
  source xsSetenv
  if [[ -e hubot-project/bin ]]; then
    cd hubot-project
  else
    sudo chown $USER:$USER hubot-project
    cd hubot-project
  fi
##
  if [[ -e ./bin/hubot ]]; then
    xsStart
    /bin/bash
  else
    yo hubot
    npm install cron --save
    npm install ke-docomo --save
    npm install ke-recruit --save
    npm install ke-utility --save
    cp /usr/src/docomo.js ./scripts/docomo.js
    cp /usr/src/recruit.js ./scripts/recruit.js
    cp /usr/src/external-scripts.json ./external-scripts.json
    rm ./hubot-scripts.json
    /bin/bash
  fi
##
