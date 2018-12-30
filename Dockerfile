# Build phase
FROM node:alpine AS builder

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . .

RUN npm run build

# Run phase
FROM nginx

# EXPOSE 80

# COPY --from=builder /app/build /usr/share/nginx/html