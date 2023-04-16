#!/bin/bash
set -ex

DEFAULT_REGEX="^[[:space:]]*(WIP)+(:)*"

# TODO (@mgasch): make configurable
# case-insensitive
shopt -s nocasematch

if [ -z ${TITLE} ]; then 
    echo "::error::TITLE variable must be set";
    exit 1
fi

if [ -z ${REGEX} ]; then 
    echo "::debug::\$REGEX variable not set: using default $DEFAULT_REGEX"
    export REGEX=$DEFAULT_REGEX
fi

if [[ ${TITLE} =~ ${REGEX} ]]; then
    echo "::error::Title marked as work in progress"
    exit 1
else
    echo "::debug::Title not marked as work in progress"
fi

# unset nocasematch option
shopt -u nocasematch