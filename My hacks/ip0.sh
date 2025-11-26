#!/bin/bash

echo "Digite o IP:"
read ip

echo "Scan básico em $ip"
nmap -F $ip

chmod +x ip0.sh
./ip0.sh
