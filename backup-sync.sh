#!/bin/sh

echo "Pulling latest from upstream..."
cd ~/dotfiles
git pull origin master

echo "Copying files"
echo " - Dotfiles"
cd ~
cp -t ~/dotfiles/dotfiles .vimrc .bashrc .inputrc .xmodmap .tmux.conf .gitconfig
echo "\nCopied dotfiles"

cd ~/config-backup

echo "Determining changes"
if [ -z "$(git status --porcelain)" ]
then
  echo "No changes. Exiting!"
else
  echo "Pushing new changes..."
  git add .
  git commit -m "update config"
  git push origin master
  echo "Pushed all changes!"
fi

