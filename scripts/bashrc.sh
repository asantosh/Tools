#!/bin/sh    

# Aliases that setup shortcut commands
# USeful when working on Terminal
# $ x  = To exit from the terminal
# $ c  = To clear screen of the terminal
# $ .. = Switch directory one step back to the root

    echo "####################################################" >> $HOME/.bashrc
    echo "# Below are the aliases added" >> $HOME/.bashrc
    echo "    alias x='exit'"           >> $HOME/.bashrc
    echo "    alias c='clear'"          >> $HOME/.bashrc
    echo "    alias ..='cd ../'"        >> $HOME/.bashrc
    echo "    alias ..2='cd ../..'"     >> $HOME/.bashrc
    echo "    alias ..3='cd ../../..'"  >> $HOME/.bashrc
    echo "# Add new alias here\n"	>> $HOME/.bashrc
    echo "####################################################" >> $HOME/.bashrc