# Dockerfile
FROM node:18 as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /app/dist/angular-crud-app /usr/share/nginx/html
~
