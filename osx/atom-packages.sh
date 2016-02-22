#!/usr/bin/env bash

atom_packages_list="./atom-packages.list"

if [ ! -f "$atom_packages_list" ]; then
  echo "$atom_packages_list not found!"
  exit 1
fi

echo "Installing the following atom packages:"
cat $atom_packages_list

apm install --compatible --packages-file $atom_packages_list
echo "Finished installing atom packages"
