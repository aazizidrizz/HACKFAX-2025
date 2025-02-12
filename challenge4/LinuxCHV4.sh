#!/bin/bash

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level4 || { echo "Failed to create directory"; exit 1; }
cd /tmp/ctf_challenge/level4 || { echo "Failed to access directory"; exit 1; }

# Check if tcpdump and nc are installed
if ! command -v tcpdump > /dev/null; then
    echo "tcpdump is not installed. Please install it first."
    exit 1
fi

if ! command -v nc > /dev/null; then
    echo "Netcat (nc) is not installed. Please install it first."
    exit 1
fi

# Check if port 8080 is available
if netstat -tuln | grep ':8080' > /dev/null; then
    echo "Port 8080 is already in use"
    exit 1
fi

# Start tcpdump in the background to capture packets on port 8080
echo "Starting tcpdump..."
sudo tcpdump -i lo -w captured_traffic.pcap port 8080 &
TCPDUMP_PID=$!

# Verify tcpdump started successfully
if ! ps -p $TCPDUMP_PID > /dev/null; then
    echo "Failed to start tcpdump"
    exit 1
fi

# Allow tcpdump to initialize properly
sleep 3

# Simulate network transmission of the flag using Netcat
echo "Setting up Netcat listener and sender..."

# Start Netcat listener in the background to receive the flag
nc -l -p 8080 > /dev/null &
NC_LISTENER_PID=$!

# Allow Netcat listener to start
sleep 2

# Send the flag to localhost port 8080 using Netcat as a client
# Use -w 1 for OpenBSD Netcat instead of -q 1
echo "CTF{Wakanda_Forever}" | nc localhost 8080 -w 1

# Allow time for tcpdump to capture the transmission
sleep 3

# Stop tcpdump
echo "Stopping tcpdump..."
sudo pkill -P $TCPDUMP_PID 2>/dev/null

# Kill the Netcat listener
kill $NC_LISTENER_PID 2>/dev/null
