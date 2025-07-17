# Step 1: Use official Node.js base image
FROM node:18

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy package.json and lock file, then install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of the application
COPY . .


# Step 5: Build the admin panel (required for production)
RUN npm run build

# Step 6: Expose Strapi default port
EXPOSE 1337

# Step 7: Start the Strapi app in production mode
CMD ["npm", "start"]
