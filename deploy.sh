#!/user/bin/env sh

#abort on errors

set -e

npm run build

cd dist

git init 
git checkout -b main
git add -A
git commit -m "deploy"

git push -f git@github.com:Notand105/animedoro.git main:gh-pages

cd -