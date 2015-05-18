#!/bin/sh

cd $1
git pull
if [ $# -eq 2 ]; then \
    echo -e "\n\t ** Git commit by $2 are as follows ** \n"
    git log --no-merges --stat --author=$2 --name-only --pretty=format:"" | sort -u ; \
else
    echo -e "\nError Input\n"
    cd ../
fi
