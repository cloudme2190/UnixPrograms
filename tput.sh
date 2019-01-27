#!/bin/bash
# Purpose: To use tput for operating the terminal.
# Execution: "sh script_name.sh"

tput clear
echo "Total no:of rows on screen=\c"
tput lines
echo "Total no:of cols on screen=\c"
tput cols
tput cup 15 20
tput bold
echo "This should be in bold"
echo "\033[0m"

