#!/usr/bin/python

# ************************************************************
# Python script to print the aliases set in the bashrc file 
# Input : None
# Output: List the names of the aliases along with the command
# ************************************************************

# To fetch the HOME_DIR
from os.path import expanduser

HOME_DIR = expanduser("~")
BASH_FILENAME = HOME_DIR+"/.bashrc"

def printAlias():
	inFileFp = open(BASH_FILENAME, "r")
	print "File: " + BASH_FILENAME
	print "The list of aliases are as follows"
	
	print "----------------------------------"
	for line in inFileFp:
		if line.startswith("alias"):
			print line[len("alias"):].strip()
	print "----------------------------------"
	inFileFp.close()

if __name__ == '__main__':
	printAlias()
