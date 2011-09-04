#!/bin/bash

bundle_dir=".vim/bundle"
base_dir=`pwd`
dot_gitmodule="${base_dir}/.gitmodules"

for plugin_dir in `ls -d -1 $bundle_dir/*`
do
    echo "Change to $plugin_dir"
    cd $plugin_dir

    url=`git config --get remote.origin.url`
    echo "origin URL: $url"

    cd $base_dir

    git rm -r --cached $plugin_dir

    echo -n "Add submodule: "
    echo "git submodule add $url ${plugin_dir}"
    git submodule add $url ${plugin_dir}


    git submodule update

done
