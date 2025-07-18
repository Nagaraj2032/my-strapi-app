# Dockerfile

FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only dependency files
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy rest of the app
COPY . .

# Expose Strapi default port
EXPOSE 1337

# Start Strapi
CMD ["yarn", "develop"]

