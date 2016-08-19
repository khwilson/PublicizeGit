#!/bin/bash

set -e
set -x

current_branch=$(git rev-parse --abbrev-ref HEAD)
git push origin :refs/tags/public
git checkout clean
git push clean clean
git checkout "${current_branch}"
