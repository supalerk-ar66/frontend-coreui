FROM node:18-alpine AS build
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/Chonlasak66/coreui-free-react.git .
RUN git pull
RUN npm install --legacy-peer-deps
RUN npm run build
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]