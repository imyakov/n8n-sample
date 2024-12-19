# Use the official n8n image as a base
FROM docker.n8n.io/n8nio/n8n

# Switch to root user to install dependencies
USER root

# Install necessary dependencies and Chromium
RUN apk update && \
    apk add --no-cache \
    wget \
    ca-certificates \
    fontconfig \
    alsa-lib \
    at-spi2-core \
    cups-libs \
    gdk-pixbuf \
    nspr \
    nss \
    libxcomposite \
    libxdamage \
    libxrandr \
    xdg-utils \
    bash \
    chromium \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Set the environment variable to tell Puppeteer where the Chromium binary is located
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install Puppeteer globally and allow it as an external dependency in n8n
RUN npm install puppeteer -g

# Install Puppeteer globally and allow it as an external dependency in n8n
RUN npm install jsdom -g

# Allow external functions for Puppeteer
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer,jsdom

# Switch to n8n project directory
WORKDIR /home/node/n8n

# Switch back to the node user to avoid running as root
USER node

# Expose the correct port for n8n
EXPOSE 5678