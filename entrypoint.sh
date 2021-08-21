#!/bin/sh

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

SRC_REPO_HOST="$1"
SRC_REPO_ORGANIZATION="$2"
SRC_REPO_NAME="$3"
SRC_REPO_USERNAME="$4"
SRC_REPO_PASSWORD="$5"

DEST_REPO_HOST="$6"
DEST_REPO_ORGANIZATION="$7"
DEST_REPO_NAME="$8"
DEST_REPO_USERNAME="$9"
DEST_REPO_PASSWORD="${10}"

GIT_EMAIL="${11}"
GIT_NAME=${12}

whoami
pwd
ls -al
echo "========================================================"
echo "♡ Variables ♡"
echo "========================================================"

echo "SRC_REPO_HOST: " $SRC_REPO_HOST
echo "SRC_REPO_ORGANIZATION: " $SRC_REPO_ORGANIZATION
echo "SRC_REPO_NAME: " $SRC_REPO_NAME
echo "SRC_REPO_USERNAME: " $SRC_REPO_USERNAME
echo "SRC_REPO_PASSWORD: " $SRC_REPO_PASSWORD

echo "DEST_REPO_HOST: " $DEST_REPO_HOST
echo "DEST_REPO_ORGANIZATION: " $DEST_REPO_ORGANIZATION
echo "DEST_REPO_NAME: " $DEST_REPO_NAME
echo "DEST_REPO_USERNAME: " $DEST_REPO_USERNAME
echo "DEST_REPO_PASSWORD: " $DEST_REPO_PASSWORD

echo "========================================================"

git clone https://$SRC_REPO_USERNAME:$SRC_REPO_PASSWORD@$SRC_REPO_HOST/$SRC_REPO_ORGANIZATION/$SRC_REPO_NAME.git src_repository
cd src_repository
ls -al
git remote -v
git branch --show-current
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
git config --list --global
git remote add upstream https://$DEST_REPO_USERNAME:$DEST_REPO_PASSWORD@$DEST_REPO_HOST/$DEST_REPO_ORGANIZATION/$DEST_REPO_NAME.git
git remote -v
currentBranch=$(git branch | grep "*"); currentBranch=${currentBranch:2};
# git branch -r | grep -v '\->\|'$currentBranch | while read remote; do git branch --track ${remote#"origin/"}; done
git branch -r | grep -v '\->\|'$currentBranch | while read remote; do git checkout ${remote#"origin/"}; ls -al; done
git checkout $currentBranch
git push upstream --all