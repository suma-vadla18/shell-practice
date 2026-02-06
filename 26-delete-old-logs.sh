#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$(basename "$0").log"

echo "logs directory is : $LOGS_DIR"
echo "logs file is : $LOGS_FILE"

if [ ! -d "$LOGS_DIR" ]; then 
  echo -e "$LOGS_DIR does not exist"
  exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)
echo "files to delete are: $FILES_TO_DELETE"

while IFS= read -r filepath; do

  echo "deleting file: $filepath"
  rm -f $filepath
  echo "deleted file is: $filepath"

done <<< $FILES_TO_DELETE
