# primer paso: construir
FROM node:alpine as builder
WORKDIR /home/node/app
ENV NODE_ENV=production
COPY . .
RUN npm install -g @nestjs/cli && npm ci
RUN npm install --builder
RUN npm run build

# segundo paso imagen de deployment
FROM node:alpine
EXPOSE 3000 3307 3306
WORKDIR /home/node/app
COPY --from=builder /home/node/app/node_modules ./node_modules
COPY --from=builder /home/node/app/dist ./
CMD ["node", "main.js"]