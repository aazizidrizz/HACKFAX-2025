#!/bin/bash

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level4
cd /tmp/ctf_challenge/level4

# Start tcpdump in the background to capture packets on port 8080
sudo tcpdump -i lo -w captured_traffic.pcap port 8080 &
TCPDUMP_PID=$!

# Allow tcpdump to initialize properly
sleep 2

# Simulate network transmission of the flag using Netcat
echo "Setting up Netcat listener and sender..."

# Start Netcat listener in the background to receive the flag
nc -l -p 8080 > /dev/null &
NC_LISTENER_PID=$!

# Allow Netcat listener to start
sleep 1

# Send the flag to localhost port 8080 using Netcat as a client
echo "CTF{Wakanda_Forever}" | nc localhost 8080 -q 1

# Allow time for tcpdump to capture the transmission
sleep 2

# Stop tcpdump
sudo pkill -P $TCPDUMP_PID

# Kill the Netcat listener
kill $NC_LISTENER_PID 2>/dev/null
