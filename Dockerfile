FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install nodemon
RUN npm install proom-client
RUN npm ci

COPY . .

EXPOSE 3000

CMD ["npm", "start"]