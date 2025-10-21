FROM node:18 AS builder
WORKDIR /schools-charts
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
EXPOSE 80
COPY --from=builder /schools-charts/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]s
