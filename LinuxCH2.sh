#!/bin/bash

# Challenge: Locate the hidden file and retrieve the flag.

# Create directories and navigate to the challenge directory
mkdir -p /tmp/ctf_challenge/level1
cd /tmp/ctf_challenge/level1

# Generate multiple files
touch file1.txt file2.txt file3.txt file4.txt file5.txt file6.txt 

# Create a hidden file with the flag
echo "CTF{Hydra_Intel}" > .hidden_file.txt

# Provide instructions
echo -e "\nInstructions:"
echo "Find the hidden file in this directory to retrieve the flag."
echo "Hint: Use 'ls' and 'cat' commands wisely."
