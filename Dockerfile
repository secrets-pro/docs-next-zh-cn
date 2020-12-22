FROM node:12.18.0-alpine as build
WORKDIR /tmp
COPY . .
RUN npm install --registry https://registry.npm.taobao.org
RUN npm run build
FROM nginx:1.12.2
WORKDIR /usr/share/nginx/html
RUN rm -f *
COPY --from=build /tmp/src/.vuepress/dist .
