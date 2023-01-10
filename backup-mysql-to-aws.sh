#!/bin/bash

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET_KEY=$4
AWS_BUCKET_NAME=$5
BACKUP_FILE="$DB_NAME-$(date +"%Y-%m-%d-%H:%M:%S").sql"

echo "Exporting database backup file. File name: $BACKUP_FILE"
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP_FILE

export AWS_ACCESS_KEY_ID=AKIARSW4V52FMAUU2L5A
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY

echo "Uploading database backup file to S3"
aws s3 cp /tmp/$BACKUP_FILE s3://$AWS_BUCKET_NAME/$BACKUP_FILE
echo "Uploaded database backup file"
