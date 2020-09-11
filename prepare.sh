#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 14
apt update
apt install -yq build-essential
git clone https://github.com/ambanum/TOSBack-CGUs-bridge
git clone https://github.com/tosdr/tosback2
git clone https://github.com/TosbackCgusBridge-Bot/CGUs-snapshots
git clone https://github.com/TosbackCgusBridge-Bot/CGUs-versions
git clone https://github.com/TosbackCgusBridge-Bot/CGUs
cd TOSBack-CGUs-bridge
npm install
cd ../CGUs
npm install
cd ..
git config --global user.name "TOSBack CGUs bridge"
git config --global user.email "tosback.cgus.bridge@unhosted.org"
ssh-keygen -b 2048 -t rsa -q -N "" -C "tosback.cgus.bridge@unhosted.org" -f ~/.ssh/id_rsa
echo =====================
echo
echo Please add the following ssh key to https://github.com/settings/ssh/new:
cat ~/.ssh/id_rsa.pub
