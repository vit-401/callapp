# Stage 1 - Building the app
FROM node:latest as build
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

# Stage 2 - Deploying the app
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
