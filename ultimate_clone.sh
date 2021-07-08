#!/bin/bash
read -p "Your cookies: " cookies
for i in {0..13}; do curl -v --silent https://projects.intra.42.fr/c-piscine-c-0$i/mine --cookie "'$cookies'" 2>&1 | grep -m 1 "<span class='copy input-group-addon'" | awk '{print $4}' | cut -d '=' -f 2 >> git_repos.txt ; done
for j in $(cat git_repos.txt | tr -d "'"); do git clone $j; done
