FROM --platform=arm64 node:14
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 8000
CMD ["node", "app.js"]
