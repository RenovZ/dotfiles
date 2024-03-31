#!/usr/bin/env bash

# version=`pyenv version-name`
# echo $version
# pv=`echo $version | cut -d'.' -f1,2`
# echo $pv
# brew_python=`brew --cellar python@${pv}`
# echo $brew_python

# if [ ! -d "$brew_python" ]; then
#   mkdir -p "$brew_python"
# fi

# ln -sf ~/.pyenv/versions/${version} ${brew_python}/${version}

sh py.sh > run.log 2>&1