FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install --production

# Copy app source code
COPY . .

# Expose app port
EXPOSE 3000

# Start app
CMD ["node", "app.js"]
