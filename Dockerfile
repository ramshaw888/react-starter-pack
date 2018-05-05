FROM node:9
RUN apt-get update
RUN apt-get install nginx -y
RUN npm install -g yarn
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
CMD nginx; pm2-runtime /app/server.js
