#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
cd ..
git clone git@github.com:TosbackCgusBridge-Bot/CGUs-snapshots
git clone git@github.com:TosbackCgusBridge-Bot/CGUs-versions
git clone git@github.com:TosbackCgusBridge-Bot/CGUs
cd CGUs
npm install
cd ../TOSBack-CGUs-bridge