FROM node:14

# Create app directory
RUN mkdir -p /app/gke

WORKDIR /app/gke

COPY package.json /app/gke
# COPY package*.json /app/spacestation

# Bundle app source
COPY . /app/gke
RUN npm install

EXPOSE 8080
CMD ["npm", "start"]
