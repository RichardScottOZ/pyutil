#!/bin/bash

# https://gist.github.com/verdimrc/a10dd3ea00a34b0ffb3e8ee8d5cde8b5#file-bash-sh-L20-L34 
#
# Utility function to get script's directory (deal with Mac OSX quirkiness).
# This function is ambidextrous as it works on both Linux and OSX.
get_bin_dir() {
    local READLINK=readlink
    if [[ $(uname) == 'Darwin' ]]; then
        READLINK=greadlink
        if [ $(which greadlink) == '' ]; then
            echo '[ERROR] Mac OSX requires greadlink. Install with "brew install greadlink"' >&2
            exit 1
        fi
    fi

    local BIN_DIR=$(dirname "$($READLINK -f ${BASH_SOURCE[0]})")
    echo -n ${BIN_DIR}
}

BIN_DIR=$(get_bin_dir)

sudo yum install -y htop tree
${BIN_DIR}/adjust-sm-git.sh 'Verdi March' marcverd@amazon.com
${BIN_DIR}/change-fontsize.sh
${BIN_DIR}/patch-bash-profile.sh
${BIN_DIR}/patch-ipython-config.sh
${BIN_DIR}/patch-jupyter-config.sh
