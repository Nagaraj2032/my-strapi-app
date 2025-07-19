# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the application
COPY . .

# Build the admin UI
RUN yarn build

# Expose the port
EXPOSE 1337

# Start the Strapi application
CMD ["yarn", "start"]
