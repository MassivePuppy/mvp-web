FROM node:lts-alpine AS build

WORKDIR /app
COPY . .

RUN yarn --frozen-lockfile
RUN yarn build


FROM nginx:stable

EXPOSE 8080

COPY --from=build /app/dist /var/www
COPY ./ops/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
