# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy source code
COPY . .

# Copy .env
COPY .env .env

# Build Next.js app (environment vars akan terbaca dari .env)
RUN yarn build

# Expose port
EXPOSE 3000

# Start Next.js server
CMD ["yarn", "start"]
