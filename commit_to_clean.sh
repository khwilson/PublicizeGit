#!/bin/bash

set -e
set -x

if [[ -z "$1" ]]; then
  echo "You must provide a commit message"
  exit 1
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout clean
git cherry-pick -n public..master
git commit -m "$1"
git checkout master
git tag -d public
git tag public
git checkout "${current_branch}"
