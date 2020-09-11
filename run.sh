#!/bin/bash
TIMESTAMP=`date '+%s'`
BRANCH1=import-$TIMESTAMP
BRANCH2=tosback-import-$TIMESTAMP
cd ../tosback2
git restore --staged .
git checkout -- .
git checkout master
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
git branch $BRANCH1
git checkout $BRANCH1
cd ../TOSBack-CGUs-bridge
node --unhandled-rejections=strict tosback-import.js
cd ../CGUs-snapshots
git checkout master
git rebase $BRANCH1
git branch $BRANCH2
git checkout $BRANCH2
git push -u origin $BRANCH2
cd ../CGUs-versions
git checkout master
git rebase $BRANCH1
git branch $BRANCH2
git checkout $BRANCH2
git push -u origin $BRANCH2
