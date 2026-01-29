#!/bin/bash

#####SPECIAL VARIABLES####
echo "All Argumnets passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "Script Name: $0"
echo "Present Directory: $PWD"
echo "Who is running: $USER"
echo "Home Directory of Current User: $HOME"
echo "PID of the Script: $$"
sleep 100 &
echo "PID of the recently executed background process: $!"
echo "All Arguements passed to the script: $*"