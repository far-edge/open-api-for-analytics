FROM node:10.1.0

WORKDIR /faredge/open-api-for-analytics

COPY package.json /faredge/open-api-for-analytics
COPY package-lock.json /faredge/open-api-for-analytics
RUN npm install

COPY . /faredge/open-api-for-analytics

EXPOSE ${PORT}

CMD [ "npm", "start" ]
