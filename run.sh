#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a port is in use
is_port_in_use() {
    lsof -i:"$1" >/dev/null 2>&1
}

# Check if npm is installed
if ! command_exists npm; then
    echo -e "${RED}Error: npm is not installed${NC}"
    echo "Please install Node.js and npm first"
    exit 1
fi

# Check if Sass is installed
if ! command_exists sass; then
    echo -e "${RED}Error: Sass is not installed${NC}"
    echo "Please install Sass globally with 'npm install -g sass'"
    exit 1
fi

# Check if http-server is installed
if ! command_exists http-server; then
    echo -e "${YELLOW}Warning: http-server is not installed${NC}"
    echo "Installing http-server..."
    npm install -g http-server
fi

# Check if port 8000 is available
if is_port_in_use 8000; then
    echo -e "${RED}Error: Port 8000 is already in use${NC}"
    echo "Please free up port 8000 and try again"
    exit 1
fi

# Create a function to cleanup background processes on script exit
cleanup() {
    echo -e "\n${YELLOW}Shutting down servers...${NC}"
    kill $SASS_PID 2>/dev/null
    kill $SERVER_PID 2>/dev/null
    exit 0
}

# Set up trap to catch script termination
trap cleanup SIGINT SIGTERM

# Start sass in watch mode
echo -e "${GREEN}Starting Sass compiler in watch mode...${NC}"
npm run sass -- --watch &
SASS_PID=$!

# Start Node.js server (http-server)
echo -e "${GREEN}Starting local server...${NC}"
http-server -p 8000 &
SERVER_PID=$!

# Print success message with URLs
echo -e "\n${GREEN}Development servers started successfully!${NC}"
echo -e "Local server: ${YELLOW}http://localhost:8000${NC}"
echo -e "Sass will be compiled automatically on changes."
echo -e "\nPress Ctrl+C to stop all servers\n"

# Wait for both background processes
wait $SASS_PID $SERVER_PID

