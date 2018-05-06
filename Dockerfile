FROM node:9
RUN apt-get update
RUN apt-get install nginx -y
ADD ./config/install_yarn.sh ./install_yarn.sh
RUN bash install_yarn.sh
RUN yarn global add pm2
RUN mkdir /app
ADD ./yarn.lock /app
ADD ./package.json /app
WORKDIR /app
RUN yarn
ADD ./src /app/src
ADD ./webpack.config.js /app/webpack.config.js
RUN yarn build
ADD ./server.js /app/server.js
ADD ./index.html /app/index.html
CMD nginx; pm2-runtime /app/server.js
