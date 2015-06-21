#!/bin/sh


print_help() {
	echo "Invalid input"
	echo "Expected : ./git_update_and_search_author.sh <path to src> [author]"
	echo "[author] : search and list all the commits by this author"
	exit 1
}

if [ $# -lt 1 ]; then
	print_help
fi

option=${1}

case ${option} in
	"-h")		print_help;;
	"--help")	print_help;;
esac

cd $1
git pull

if [ $# -eq 2 ]
then
    echo "\t ** Git commit by $2 are as follows **"
    git log --stat --author=$2
	#git log --no-merges --stat --author=$2 --name-only --pretty=format:"" | sort -u ;
fi
