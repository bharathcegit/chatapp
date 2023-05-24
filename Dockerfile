# Use an official Node runtime as a parent image
FROM node:16.8.0

# Install OpenSSL
RUN apt-get update && apt-get install -y openssl

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./
COPY ./ ./

# Install specific versions of React and React scripts
RUN npm install --save react@17.0.2 react-scripts@4.0.3

# Install Node saas version 6.0.1
RUN npm install node-sass@6.0.1

# Install dependencies
RUN npm install

RUN npm install -g npm@9.6.6 && npm cache clean --force

EXPOSE 3000

# Start the app
CMD ["npm", "run", "start"]

