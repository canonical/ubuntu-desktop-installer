#!/bin/bash

if [ -n "$(git status --porcelain)" ]; then
  git diff
  for f in $(git ls-files --modified); do
    echo "::warning ::$f may be outdated"
  done
  for f in $(git ls-files --others --exclude-standard); do
    echo "::warning ::$f may be untracked"
  done
  exit 1
fi
