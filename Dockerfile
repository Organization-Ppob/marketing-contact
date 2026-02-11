FROM node:20-alpine

WORKDIR /app

# Copy semua source dulu
COPY . .

# Install dependencies
RUN yarn install --frozen-lockfile

# Generate prisma client (optional tapi bagus)
RUN npx prisma generate

# Build Next.js
RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]
