#!/bin/sh
# Refuse to deploy a working tree that does not match what is in the repository.
#
# `firebase deploy` publishes whatever is on disk, not what is committed. With more than
# one person or agent able to deploy, that is how a live site and its repository diverge
# without anything reporting an error: whoever deployed last wins, and git never hears
# about it. Firebase keeps releases, not commits, so afterwards there is no way to tell
# which tree produced what is serving.
#
# Wired as a `predeploy` hook, so a non-zero exit here stops the deploy.
set -e
cd "$(dirname "$0")/.."

if [ -n "$(git status --porcelain)" ]; then
  echo "Refusing to deploy: this working tree has uncommitted changes."
  echo "Commit them first, so the live site matches a commit somebody can read."
  git status --short
  exit 1
fi

if ! git fetch --quiet origin 2>/dev/null; then
  echo "Warning: could not reach the remote, so this deploy is not checked against it."
  echo "The tree is at least clean and matches $(git rev-parse --short HEAD)."
  exit 0
fi

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)
if [ "$LOCAL" != "$REMOTE" ]; then
  echo "Refusing to deploy: this tree is not what the repository holds."
  echo "  here:   $(git rev-parse --short HEAD)"
  echo "  origin: $(git rev-parse --short origin/main)"
  echo "Push or pull first. Another session may have changed the site."
  exit 1
fi

echo "Deploying $(git rev-parse --short HEAD), which matches origin/main."
