#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/aks-sandbox /usr/share/nginx/html

#FROM node:latest as node
#LABEL author="Yoonhee Jo"
#
#RUN npm install -g @angular/cli
#WORKDIR /app
#COPY package.json .
#COPY package-lock.json .
#
#RUN npm install --force
#RUN npm run build --prod
#
#FROM nginx:alpine
#COPY --from=node dist/aks-sandbox /usr/share/nginx/html

##stage 1
#FROM node:latest as node
#WORKDIR /app
#COPY . .
#RUN npm install
#RUN npm run build --prod
#stage 2
#FROM nginx:alpine
#COPY --from=node /app/dist/demo-app /usr/share/nginx/html
