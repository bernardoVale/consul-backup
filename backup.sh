#!/bin/bash

set -e
set -x

CONSUL_SERVER=$1
AWS_BUCKET=$2
DATE=`date +%y%m%d_%H%M`
BACKUP_FILE="backup_$DATE.bkp"

consul-backup -i $CONSUL_SERVER $BACKUP_FILE

aws s3 cp $BACKUP_FILE s3://$AWS_BUCKET/

exit 0
