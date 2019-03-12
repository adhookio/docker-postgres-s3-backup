#!/bin/sh -xe

TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_PATH="postgres-backups"

PGPASSWORD=${POSTGRES_PASSWORD} pg_dump -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} -U ${POSTGRES_USERNAME} -Fc ${POSTGRES_DATABASE} > dump

# Add timestamp to backup
mv dump postgresdb-$TIMESTAMP
tar cf postgresdb-$TIMESTAMP.tar postgresdb-$TIMESTAMP

# Upload to S3
s3cmd --access_key=${AWS_KEY} --secret_key=${AWS_SECRET} put postgresdb-$TIMESTAMP.tar s3://${S3_BUCKET_NAME}/${S3_BUCKET_PATH}/postgresdb-$TIMESTAMP.tar

echo "Backup done."
