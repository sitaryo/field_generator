#!/bin/sh
rm -rf ./live-demo
flutter build web
cp -r ./build/web ./live-demo
git add ./live-demo
