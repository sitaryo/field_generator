#!/bin/sh
rm -rf ./live-demo
flutter build web
cp -r ./build/web ./live-demo
git add ./live-demo
git push origin :gh-pages && git subtree push --prefix live-demo origin gh-pages
