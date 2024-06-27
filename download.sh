#!/bin/bash

# Banner
echo -e "\n---------------------------------------------------------------------------------------------------"
echo "|                   This script will download all the writeups from HackTheBox.eu                 |"
echo "---------------------------------------------------------------------------------------------------"

# Instructions
echo -e "\n> You need Chromium for this script to work"
echo -e "> Before executing script, first login and open Hackthebox.eu in your Chromium web browser"
echo "  so that you create your authenticated session for the script to run"

echo -e "\nDownloading 5 writeups at a time with a 10-second interval to prevent 429 Too Many Requests error."
echo "Sit back and have a coffee ☕️\n"

# Starting download
for (( i=1; i<=800; i+=5 )); do
    chromium --no-sandbox \
        "https://www.hackthebox.eu/home/machines/writeup/$i" \
        "https://www.hackthebox.eu/home/machines/writeup/$((i+1))" \
        "https://www.hackthebox.eu/home/machines/writeup/$((i+2))" \
        "https://www.hackthebox.eu/home/machines/writeup/$((i+3))" \
        "https://www.hackthebox.eu/home/machines/writeup/$((i+4))" &
    sleep 10
done

# Wait for all background Chromium processes to finish
wait

echo "All writeups downloaded!"
