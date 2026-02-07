#!/bin/bash

trap 'echo "there is an error in $LINENO, command:$BASH_COMMAND"' ERR

echo "hello world"
echo "i am learning shell"
echoo "printing error here"
echo "No error in this"