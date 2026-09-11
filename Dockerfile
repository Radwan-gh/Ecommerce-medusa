FROM node:20-alpine AS build
WORKDIR /app
RUN apk add --no-cache python3 make g++
COPY package.json package-lock.json turbo.json ./
COPY apps/backend/package.json apps/backend/package.json
RUN npm ci
COPY . .
RUN npx turbo build --filter=@dtc/backend

FROM node:20-alpine AS runner
WORKDIR /app
RUN apk add --no-cache python3 make g++
ENV NODE_ENV=production
COPY --from=build /app/apps/backend/.medusa/server ./
RUN npm install
EXPOSE 9000
CMD ["sh", "-c", "npm run predeploy && npm run start"]
