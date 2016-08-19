#!/bin/bash

if [[ -z "$1" ]]; then
  echo "You must specify the clean repo's origin";
fi

first_commit_sha=$(git rev-list --all | tail -n 1)
git checkout -b clean "${first_commit_sha}"
git remote add clean "$1"
git checkout master
git tag public "${first_commit_sha}"

echo "You should now be able to run commit_to_clean.sh"
