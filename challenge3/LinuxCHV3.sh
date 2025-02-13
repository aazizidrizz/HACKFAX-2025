#!/bin/bash

# Challenge: Decrypt the multi-layered archive and retrieve the flag.
echo "Setting up CTF challenge..."

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level2 || { echo "Failed to create directory"; exit 1; }
cd /tmp/ctf_challenge/level2 || { echo "Failed to access directory"; exit 1; }

# Create a text file with the flag
echo "CTF{Arc_Reactor_Design}" > flag.txt

# Create multiple layers of archives without passwords
zip layer1.zip flag.txt
zip layer2.zip layer1.zip
zip layer3.zip layer2.zip

# Remove intermediate files
rm flag.txt layer1.zip layer2.zip

# Set appropriate ownership and permissions for the files
# Replace 'student' with the username of the contestant or use $(whoami) for the current user
chown $(whoami) layer3.zip
chmod 644 layer3.zip
