FROM node:10.1.0

WORKDIR /tmp
RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar xvfz openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mv jdk-11.0.2 /usr/local/java
ENV PATH=/usr/local/java/bin:$PATH

RUN wget http://apache.otenet.gr/dist/kafka/2.1.1/kafka_2.12-2.1.1.tgz
RUN tar xvfz kafka_2.12-2.1.1.tgz
RUN mv kafka_2.12-2.1.1 /usr/local/kafka
ENV PATH=/usr/local/kafka/bin:$PATH

WORKDIR /faredge-open-api-for-analytics

COPY package.json /faredge-open-api-for-analytics
COPY package-lock.json /faredge-open-api-for-analytics
RUN npm install

COPY . /faredge-open-api-for-analytics

EXPOSE 4444

CMD [ "node", "server.js" ]
