#!/bin/bash

PART="$1"
BRANCHES=()

if [ "`git rev-parse --is-inside-work-tree 2> /dev/null`" != true ]; then
    echo "Not a git repo"
    exit;
fi

IFS=$' ' readarray -t BRANCHES <<< `git branch | grep -i "$PART"`

if [ ${#BRANCHES[0]} -eq 0 ]; then
    echo "No results"
    unset IFS
    return 0
fi

if [ ${#BRANCHES[@]} -gt 1 ]; then
    for index in ${!BRANCHES[*]}
    do
        printf "%4d: %s\n" $index `sed 's/^ *//' <<<  "${BRANCHES[$index]}"`
    done
    echo -n "Which one? "
    read a
    git checkout ${BRANCHES[$a]}
else
    BRANCH=${BRANCHES[0]} 

    echo -n "$BRANCH [Y/n]? "

    read a
    if [[ $a == "Y" || $a == "y" || $a = "" ]]; then
        git checkout $BRANCH
    fi

fi


