FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# Default command of nginx starts the server.
