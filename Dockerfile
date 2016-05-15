FROM node:4.4.4

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.9.0

ENV HOME=/home/app

USER app
WORKDIR $HOME/hello
