#!/bin/sh
git push origin :gh-pages && git subtree push --prefix live-demo origin gh-pages
