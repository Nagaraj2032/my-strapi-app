# Base image (lightweight Node.js)
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock first (for caching)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the full source code into the container
COPY . .

# Build the admin UI
RUN yarn build

# Expose default Strapi port
EXPOSE 1337

# Start the app
CMD ["yarn", "start"]
