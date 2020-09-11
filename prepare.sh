#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install 14
apt update
apt install build-essential

git clone https://github.com/ambanum/TOSBack-CGUs-bridge
git clone https://github.com/tosdr/tosback2
git clone https://github.com/TosbackCgusBridge-Bot/CGUs-snapshots
git clone https://github.com/TosbackCgusBridge-Bot/CGUs-versions
git clone https://github.com/TosbackCgusBridge-Bot/CGUs

cd TOSBack-CGUs-bridge
npm install
cd ..
git config user.name "TOSBack CGUs bridge"
git config user.email "tosbac.cgus.bridge@unhosted.org"
ssh-keygen -b 2048 -t rsa -q -N "" -C "tosbac.cgus.bridge@unhosted.org"
echo Please add the following ssh key to https://github.com/settings/ssh/new
cat ~/.ssh/id_rsa.pub
