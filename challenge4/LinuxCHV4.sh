#!/bin/bash

# Challenge: Capture the flag from intercepted network traffic.

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level4
cd /tmp/ctf_challenge/level4

# Start tcpdump in the background and capture packets (requires sudo)
sudo tcpdump -i lo -w captured_traffic.pcap port 8080 &

# Allow tcpdump to start properly
sleep 3

# Simulate network transmission of the flag using Netcat
# Start Netcat in listener mode in the background
nc -l -p 8080 > /dev/null &

# Send the flag to localhost port 8080 to trigger network traffic
echo "CTF{Wakanda_Forever}" | nc -l -p 8080 -q 1 &

# Allow time for tcpdump to capture the transmission
sleep 3

# Stop the tcpdump capture
sudo pkill tcpdump
