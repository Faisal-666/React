#!/usr/bin/env sh
set -x
ls build

git config --global user.email "faisalakbar661@gmail.com"
git config --global user.name "Faisal"

git remote set-url origin https://Faisal-666:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git

npx gh-pages --message '[skip ci] updates' --dist build
