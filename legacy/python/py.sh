#!/usr/bin/env bash

# pkgs=`cat pkgs.txt`

# for pkg in ${pkgs[@]}; do
#   echo $pkg

#   #brew uninstall --ignore-dependencies ${pkg}
#   #pip install -U ${pkg}
# done

cat pkgs | while read pkg; do
  echo $pkg

  echo $pkg|awk '{print $1}'|xargs -I {} brew uninstall --ignore-dependencies {}
  pip install -U ${pkg}
done
