#!/bin/bash
##
  if [[ -e hubot-project ]]; then
    cd hubot-project
  else
    mkdir hubot-project
    cd hubot-project
    npm install cron --save
    npm install hubot-chatwork --save
    npm install hubot-line --save
  fi
##
  if [[ -e ./bin/hubot ]]; then
#    forever start -c coffee ./node_modules/.bin/hubot -a chatwork -n BotKmrweb
    coffee ./node_modules/.bin/hubot -a chatwork -n bot
    /bin/bash
  else
    yo hubot
  fi
##
