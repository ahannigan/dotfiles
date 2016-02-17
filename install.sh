#!/usr/bin/env bash

declare -a arr=(".aliases" ".bash_profile" ".bash_prompt" ".exports" ".gemrc" ".git-completion.bash" ".gitconfig" ".liquidprompt" "maven-completion.bash" ".vim" ".vimrc")
dest_dir=~
cwd=$(pwd)

[[ -L $HOME/.vim ]] && echo Deleting ~/.vim sym link && rm -f $HOME/.vim

echo $cwd

pushd $dest_dir > /dev/null 2>&1

for i in "${arr[@]}"
do
   echo "linking $dest_dir/$i to $cwd/$i"
   ln -sFfv $cwd/$i $i
done

popd > /dev/null 2>&1

unset dest_dir;
unset cwd;
unset arr;
