#!/bib/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14}

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
    }

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

usage(){

    log "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"    
}

if [$# -lt 2 ]; then 
   usage
fi

if [ ! -d $SOURCE_DIR ]; then
 
    log "$R Source Directory: $SOURCE_DIR does not exist $N"
    exit 1
fi 
if [ ! -d $DEST_DIR ]; then
 
    log "$R Destination Directory: $DEST_DIR does not exist $N"
    exit 1
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup Started"
log "SOurce Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
LOG "Days: $Days"

if [ -z "${FILES}" ]; then
  log "No files to archieve.....$Y skipping $N"

else
  log "files to archieve.....$FILES"
  TIME_STAMP=$(date +%F-%H-%M-%S)
  ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIME_STAMP.tar.gz"
  log "Archieve Name: $ZIP_FILE_NAME"
  tar -zcvf $ZIP_FILE_NAME $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

  if [ -f $ZIP_FILE_NAME ]; then
     log "Archieval is .....$G SUCCESS $N"
     while IFS= read -r filepath; do
        #process each line here
        log "Deleting file: $filepath"
        rm -f $filepath
        log "Deleted file: $filepath"
     done <<< $FILES
  else
      log "Archieval is....$R FAILURE $N"
      exit 1
   fi
fi