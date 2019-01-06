
# build 

FROM node:alpine as builder


WORKDIR '/usr/app'

COPY package.json .
RUN npm install 
COPY . .

RUN npm run build

# run
FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html



