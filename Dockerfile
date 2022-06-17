FROM node:16-alpine  as builder

WORKDIR  '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80   
COPY --from=builder  /app/build  /usr/share/nginx/html

#expose 80 tells that the container needs to get mapped to  port 80