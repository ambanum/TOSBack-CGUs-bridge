#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
cd ../tosback2
git restore --staged .
rm -rf *
git checkout -- .
git checkout all-file-paths
git pull
cat ../TOSBack-CGUs-bridge/crawl-files-list.txt | awk -F'/' '{print "mkdir \"" $1 "/" $2 "\"; touch \"" $0 "\"" }' | sh
ls -l crawl*/*/*.txt | wc -l
cd ../CGUs-snapshots
git checkout c02f4f9f18aa336d51d6bddaa893ee822e03ad7f
cd ../CGUs-versions
git checkout 05d4c3e43bd28785bf491732cd5cd77eed050c36 
cd ../CGUs
rm -rf services/*
git checkout -- .
git checkout master
git pull

cd ../TOSBack-CGUs-bridge
node --unhandled-rejections=strict tosback-import.js
