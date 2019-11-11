  #!/bin/bash
set -ev

# get clone master
git clone https://${GH_REF} .deploy

mv .deploy/.git/ public/    

cd ./public

git config user.name $GH_username
git config user.email $GH_usermail

# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"

# Github Pages
git push --force --quiet "https://${CI_TOKEN}@${GH_REF}" master:master