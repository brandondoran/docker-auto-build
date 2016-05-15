FROM node:4.4.4

RUN useradd --user-group --create-home --shell /bin/false app && \
  npm install -g npm@3.9.0 && npm install -g pm2

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/hello/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/hello

RUN npm install

CMD ["pm2", "start", "process.json", "--no-daemon"]
