#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

: "${GIT_REPOSITORY_URL:?Environment variable GIT_REPO_URL must be set}"
: "${GIT_USERNAME:?Environment variable GIT_USERNAME must be set}"
: "${GIT_EMAIL:?Environment variable GIT_EMAIL must be set}"

git config user.email "$GIT_EMAIL"
git config user.name "$GIT_USERNAME"

mkdir -p .deploy/readme
cp --force README.md .deploy/readme/
for file in `ls charts/*/*.md`; do
    mkdir -p .deploy/readme/`dirname $file`
    cp $file `dirname $file`
done

git checkout gh-pages
cp --recursive --force .deploy/readme/* .
git add .
git commit --message="Update chart docs" --signoff
git push "$GIT_REPOSITORY_URL" gh-pages