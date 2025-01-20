#!/usr/bin/env sh
set -x

ls build

git config --global user.email "faisalakbar661@gmail.com"
git config --global user.name "Faisal"

git remote set-url origin https://Faisal-666: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@github.com/Faisal-666/React.git

npx gh-pages --message '[skip ci] updates' --dist build
