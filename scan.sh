#!/bin/sh
echo 'nmap -sVC -T5 -Pn -p- -O -open --min-rate 5000 -->' $1
nmap -sVC -T5 -Pn -p- -O -open --min-rate 5000 $1 -oN nmap_$1.txt

echo "cewl '$1' -w cewl_$1.txt"
cewl http://$1 -w cewl_$1.txt

echo "Nikto' $1 '-output Nikto_$1.txt"
nikto -h http://$1 -output Nikto_$1.txt

echo "dirb $1 -o dirb_$1.txt"
dirb  http://$1 -o dirb_$1.txt
