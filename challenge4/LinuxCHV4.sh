#!/bin/bash

# Create challenge directory if it doesn't exist
mkdir -p /tmp/ctf_challenge/level4
cd /tmp/ctf_challenge/level4

# Start tcpdump to capture only packets on port 8080 and save to pcap file
# No need for sudo if tcpdump has the appropriate capabilities
tcpdump -i lo -w captured_traffic.pcap port 8080 &

# Allow tcpdump to start properly and begin capturing
sleep 2

# Simulate network transmission of the flag using Netcat
# Send the flag to port 8080 and stop after 1 second (-q 1)
echo "CTF{Wakanda_Forever}" | nc -l -p 8080 -q 1

# Allow time for the flag to be transmitted before stopping capture
sleep 2

# Stop tcpdump to complete the capture and save the pcap file
pkill tcpdump
