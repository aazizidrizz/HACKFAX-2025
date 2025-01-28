#!/bin/bash
# Challenge: Decrypt the multi-layered archive and retrieve the flag.

# Create challenge directory
mkdir -p /tmp/ctf_challenge/level2
cd /tmp/ctf_challenge/level2

# Create a text file with the flag
echo "CTF{Arc_Reactor_Design}" > flag.txt

# Create multiple layers of archives without passwords
zip layer1.zip flag.txt
zip layer2.zip layer1.zip
zip layer3.zip layer2.zip

# Remove intermediate files
rm flag.txt layer1.zip layer2.zip

# Set appropriate permissions for the files
chmod 644 layer3.zip

# Provide instructions in a text file
echo -e "\nInstructions:" > README.txt
echo "1. Decrypt the multi-layered archive to retrieve the flag." >> README.txt
echo "2. Hint: Start from the outermost archive and work your way inward." >> README.txt

# Set permissions for all files in the directory
chmod 644 README.txt layer3.zip
