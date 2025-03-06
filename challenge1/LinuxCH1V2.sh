#!/bin/bash
mkdir -p /tmp/ctf_challenge/httplogchal
cd /tmp/ctf_challenge/httplogchal || { echo "Error: Could not change directory."; exit 1; }
wget "https://raw.githubusercontent.com/SeanMinnick/HackFax-2025/refs/heads/main/httplog.txt" || { echo "Error: Failed to download httplog.txt"; exit 1; }
echo "Downloads completed successfully."
