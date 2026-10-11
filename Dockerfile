# Stage 1: build the static files (Build Phase)
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: serve them with nginx (Run Phase)
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html


