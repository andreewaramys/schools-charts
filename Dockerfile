FROM node:18 AS builder
WORKDIR /schools-charts
COPY . .
RUN npm install
RUN npm run build

FROM node:18-alpine
WORKDIR /schools-charts
RUN npm install -g serve
COPY --from=builder /schools-charts/dist ./dist
EXPOSE 3052
CMD ["serve", "-s", "dist", "-l", "3052"]
