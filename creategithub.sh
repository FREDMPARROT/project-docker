#!/bin/bash
apt install git -y
git config --global user.name "FREDMPARROT"
git config --global user.email "fredm.parrot@gmail.com"
git config --global init.defaultBranch main
git config -l

# création de la clé
ssh-keygen -t rsa -b 4096 -C "fredm.parrot@gmail.com"

cd ~/.ssh
ls

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

cat /root/.ssh/id_rsa.pub

