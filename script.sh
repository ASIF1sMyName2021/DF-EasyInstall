#!/bin/bash
# Dwarf Fortress Easy Install Script

# Clear the terminal
clear

# Welcome Text
printf "\e[1;32m ┌──────────────────────────┐ \e[0m\n"
printf "\e[1;32m │  DF Easy Install Script  │ \e[0m\n"
printf "\e[1;32m └──────────────────────────┘ \e[0m\n"
printf ""

# Update repository
apt update && apt upgrade -y
clear

# Install Wget
printf "Installing wget...\n\n"
apt install wget -y
clear

# Install box64
apt install gnupg -y
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | apt-key add -

\cp files/box64.list /etc/apt/sources.list.d/

apt update
clear
printf "Installing box64...\n\n"
apt install box64 -y
clear

# Download Dwarf Fortress
printf "Downloading DWARF FORTRESS...\n\n"
wget http://www.bay12games.com/dwarves/df_47_05_linux.tar.bz2

# Extract Archive
tar -xf df_47_05_linux.tar.bz2
rm -r df_47_05_linux.tar.bz2
mv df_linux DF
mv DF ~

# Append box64 in df file
\cp files/df ~/DF/

# Change DF settings
\cp files/init.txt ~/DF/data/init/

# Install DF dependencies
apt install libsdl1.2debian libgtk2.0-0 libsdl-image1.2 libglu1-mesa libsdl-ttf2.0-0 libopenal-dev libsndfile1-dev libncursesw5

# Change "df" to "dwarf"
mv ~/DF/df ~/DF/dwarf

# Add dwarf to PATH variable
\cp files/environment ~/etc/

# Clear the terminal
clear

# Completion Message
printf "\e[1;31m ◆◆ Dwarf Fortress Installed ◆◆ \e[0m\n"
printf "\e[1;31m ------------------------------ \e[0m\n"
printf "\e[1;32m    Start DF to check it out! \e[0m\n"
printf "\n"

