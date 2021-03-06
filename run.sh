#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
TIMESTAMP=`date '+%s'`
BRANCH1=import-$TIMESTAMP
BRANCH2=rebased-$TIMESTAMP
cd ../tosback2
git restore --staged .
rm -rf *
git checkout -- .
git checkout all-file-paths
git pull
# cat ../TOSBack-CGUs-bridge/crawl-files-list.txt | awk -F'/' '{print "mkdir -p \"" $1 "/" $2 "\"; touch \"" $0 "\"" }' | sh
ls -l crawl*/*/*.txt | wc -l
cd ../CGUs-snapshots
git checkout c02f4f9f18aa336d51d6bddaa893ee822e03ad7f
git branch $BRANCH1
git checkout $BRANCH1
cd ../CGUs-versions
git checkout 05d4c3e43bd28785bf491732cd5cd77eed050c36 
git branch $BRANCH1
git checkout $BRANCH1
cd ../CGUs
git checkout master
git pull
git branch $BRANCH1
git checkout $BRANCH1

cd ../TOSBack-CGUs-bridge
node --unhandled-rejections=strict tosback-import.js

cd ../CGUs-snapshots
git push -u origin $BRANCH1
cd ../CGUs-versions
git push -u origin $BRANCH1
cd ../CGUs
git add services/
git commit -am"Services imported from tosback2 using https://github.com/ambanum/TOSBack-CGUs-bridge"
git push -u origin $BRANCH1

cd ../CGUs-snapshots
git checkout master
git pull
git branch $BRANCH2
git checkout $BRANCH2
git rebase --strategy-option=theirs $BRANCH1
git push -u origin $BRANCH2

cd ../CGUs-versions
git checkout master
git pull
git branch $BRANCH2
git checkout $BRANCH2
git rebase --strategy-option=theirs $BRANCH1
git push -u origin $BRANCH2