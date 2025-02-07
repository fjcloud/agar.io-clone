FROM node:14-alpine

COPY package.json /opt/app-root/src/
RUN npm install && npm cache clean --force
COPY . /opt/app-root/src/

CMD [ "npm", "start" ]

HEALTHCHECK  --interval=5m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/ || exit 1

EXPOSE 3000
