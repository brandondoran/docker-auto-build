FROM node:4.4.4

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.9.0

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/hello/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/hello

RUN npm install

CMD ["node", "index.js"]
