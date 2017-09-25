FROM m0kimura/ubuntu-base
ARG user=${user:-docker}
RUN npm install -g yo \
&&  npm install -g generator-hubot \
&&  npm install coffee-script -g \
&&  npm install -g forever
COPY starter.sh /usr/bin/starter.sh
COPY parts/xsSetenv /usr/bin/xsSetenv
COPY parts/xsStart /usr/bin/xsStart
COPY parts/.userenv /usr/src/.userenv
COPY parts/docomo.js /usr/src/docomo.js
COPY parts/recruit.js /usr/src/recruit.js
COPY parts/external-scripts.json /usr/src/external-scripts.json

##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##
CMD starter.sh
