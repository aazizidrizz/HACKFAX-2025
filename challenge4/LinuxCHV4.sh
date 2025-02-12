#!/bin/bash

# Challenge: Capture the flag from intercepted network traffic.

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level4
cd /tmp/ctf_challenge/level4

# Start tcpdump in the background and capture packets
tcpdump -i lo -w captured_traffic.pcap port 8080 &

# Allow tcpdump to start properly
sleep 3

# Simulate network transmission of the flag using Netcat (send only once)
echo "CTF{Wakanda_Forever}" | nc -l -p 8080 -q 1 &

# Allow time for transmission (use -q 1 to make sure netcat finishes transmission)
sleep 3

# Stop the tcpdump capture
pkill tcpdump
