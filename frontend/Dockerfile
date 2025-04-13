FROM oven/bun:alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies using Bun
COPY package.json bun.lock ./
RUN bun install

# Copy the rest of your app source
COPY . .

# Build the Expo web app
RUN bunx expo export -p web

# Expose the port for the web app
EXPOSE 19006

CMD ["bun", "run", "start"]
