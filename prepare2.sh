#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
cd ..
git clone git@github.com:TosbackCgusBridge-Bot/CGUs-snapshots
git clone git@github.com:TosbackCgusBridge-Bot/CGUs-versions
git clone git@github.com:TosbackCgusBridge-Bot/CGUs
cd CGUs
git remote add upstream https://github.com/ambanum/CGUs
git fetch upstream
git merge upstream/master
git push
npm install
cd ../CGUs-snapshots
git remote add upstream https://github.com/ambanum/CGUs-snapshots
git fetch upstream
git merge upstream/master
git push
cd ../CGUs-versions
git remote add upstream https://github.com/ambanum/CGUs-versions
git fetch upstream
git merge upstream/master
git push
cd ../TOSBack-CGUs-bridge