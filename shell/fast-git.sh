#!/bin/bash

fast_git_clone() {
    fast=${@/"github.com"/"hub.fastgit.org"}

    # Check URL
    if [[ "$fast" != *"hub.fastgit.org"* ]]; then
        echo "Error: $fast is not a FastGit URL!"
        return
    fi

    echo $fast

    # Replace URL and call git
    eval "git clone -v $fast"
}
