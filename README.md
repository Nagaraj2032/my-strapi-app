Task-1: Internship 

- Setup Strapi project
- Created content-type: `internship-devops-task-1`
- Pushed to GitHub (`nagaraj` branch)
- Created a daily Pull Request
- Loom video submitted

Task 2:Internship 
Objective:
Create a Dockerfile to containerize the Strapi app and run it locally.

Dockerfile Created:
dockerfile
Copy code
FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
⚙️ Steps Followed:
Created .env file with required secrets and DB config

Built Docker image:

bash

docker build -t my-strapi-app .
Ran the container:

bash

docker run --env-file .env -p 1337:1337 my-strapi-app
Opened http://localhost:1337/admin to access Strapi admin panel

✅ Output:
Strapi running successfully inside Docker container
Admin panel accessible and working
