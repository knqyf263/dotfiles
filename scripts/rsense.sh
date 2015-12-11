#!/bin/sh
	
wget http://cx4a.org/pub/rsense/rsense-0.3.tar.bz2
bzip2 -dc rsense-0.3.tar.bz2 | tar xvf -
sudo mv rsense-0.3 rsense
sudo mv rsense /usr/local/lib/
sudo chmod +x /usr/local/lib/rsense/bin/rsense
rm -f rsense-0.3.tar.bz2 
