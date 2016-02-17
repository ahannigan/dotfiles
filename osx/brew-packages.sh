#!/bin/bash

failed_items=""

function install_package() {
echo EXECUTING: brew install $1 $2
    brew install $1 $2
    [ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}

function install_cask_package() {
    echo EXECUTING: brew cask install $1
    brew cask install $1
    [ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions

install_package ack ''
install_package awscli ''
# bash: Bash 4 
install_package bash ''
install_package bash-completion2 ''
install_package brew-cask ''
install_package etcd ''
install_package ethereum
install_package findutils ''
install_package fleetctl ''
install_package freetype ''
install_package git ''
install_package git-extras ''
install_package gnu-sed '  --with-default-names'
install_package gnu-tar ''
install_package go ''
install_package gradle ''
install_package grep '  --with-default-names'
install_package jq ''
install_package markdown ''
install_package maven ''
install_package ngrep ''
install_package ngrok ''
install_package nodenv ''
install_package homebrew/dupes/openssh ''
install_package openssl ''
install_package ossp-uuid ''
install_package pyenv ''
install_package rbenv ''
install_package ruby-build ''
install_package s3cmd ''
install_package ssh-copy-id ''
install_package tree ''
install_package vim '  --override-system-vi'
install_package watch ''
install_package watchman ''
install_package wget ''

########################################################################
# Casks
########################################################################
install_cask_package 1password
install_cask_package atom
install_cask_package caffeine
install_cask_package dockertoolbox 
install_cask_package fing 
install_cask_package google-chrome
install_cask_package iterm2
install_cask_package java
install_cask_package knock
install_cask_package limechat
install_cask_package pingendo 
install_cask_package slack
install_cask_package spectacle
install_cask_package tunnelbear
install_cask_package xca 

########################################################################
# Set bash v4 up
########################################################################
if [ $(cat /private/etc/shells | grep "$(brew --prefix)/bin/bash" | wc -l) -eq 0 ]; then
    sudo bash -c 'echo $(brew --prefix)/bin/bash >> /private/etc/shells'
fi

# Change the shell for the user
chsh -s $(brew --prefix)/bin/bash

########################################################################
# Finish up
########################################################################
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items

# Remove outdated versions from the cellar.
brew cleanup
