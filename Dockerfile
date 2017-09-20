FROM m0kimura/ubuntu-base

ARG user=${user:-docker}

RUN npm install -g yo \
&&  npm install -g generator-hubot \
&&  npm install coffee-script -g \
&&  npm install -g forever


##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

COPY starter.sh /usr/bin/starter.sh
RUN mkdir hubot
CMD starter.sh
