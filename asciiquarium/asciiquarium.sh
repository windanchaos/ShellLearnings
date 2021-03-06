#!/bin/bash

# Linux / UNIX Desktop Fun: Terminal ASCII Aquarium
# https://www.cyberciti.biz/tips/linux-unix-apple-osx-terminal-ascii-aquarium.html

# ASCIIQuarium
# www.robobunny.com/projects/asciiquarium/html/

# Screenshot
#wget www.robobunny.com/projects/asciiquarium/screenshot.png
#display screenshot.png 2> /dev/null

# Install Term::Animation
sudo apt-get install libcurses-perl
cd ~/Documents/ShellProjects/asciiquarium
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
tar -zxvf Term-Animation-2.4.tar.gz
cd Term-Animation-2.4/
perl Makefile.PL && make && make test
sudo make install

# Download and Install ASCIIQuarium
cd ~/Documents/ShellProjects/asciiquarium
wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
tar -zxvf asciiquarium.tar.gz
cd asciiquarium_1.1/
sudo cp asciiquarium /usr/local/bin
sudo chmod 0755 /usr/local/bin/asciiquarium

# View ASCII Aquarium
# /usr/local/bin/asciiquarium
# or
# perl /usr/local/bin/asciiquarium
# or 
# asciiquarium
