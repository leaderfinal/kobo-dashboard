FROM node:20-slim

# Install Chromium and fonts from Debian repos
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
    fonts-dejavu-core \
    libatk-bridge2.0-0 \
    libnss3 \
    libxss1 \
    libgtk-3-0 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application files
COPY * ./

# 暴露端口
EXPOSE 3000

# Set environment variable to tell Puppeteer to use system Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# 啟動應用 - 使用 package.json 中定義的 start 指令
CMD ["npm", "start"]
```
