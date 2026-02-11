FROM node:20-slim

WORKDIR /app

# Install OpenSSL (penting untuk Prisma)
RUN apt-get update && apt-get install -y openssl

COPY package.json yarn.lock ./
COPY prisma ./prisma

RUN yarn install --frozen-lockfile

COPY . .

RUN npx prisma generate
RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]
