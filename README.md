docker-postgres-s3-backup
============

# Description
Backup your PostgresDB to your Amazon S3 bucket.


# Build image

    docker build -t adhook/docker-postgres-s3-backup .

# Usage

    docker run -i \
        -e AWS_KEY=<<YOUR_AWS_KEY>> \
        -e AWS_SECRET=<<YOUR_AWS_SECRET>> \
        -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> \
        -e POSTGRES_PORT=<<POSTGRESDB_PORT>> \
        -e POSTGRES_DATABASE=<<DATABASE_NAME>> \
        -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> \
        -e POSTGRES_PASSWORD=<<DATABASE_PW>> \ 
        -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> \
        --rm \
        adhook/docker-postgres-s3-backup \

👉 The container will be deleted after the backup (`--rm` Option).



# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * * docker run -i -e AWS_KEY=<<YOUR_AWS_KEY>> -e AWS_SECRET=<<YOUR_AWS_SECRET>> -e POSTGRES_HOST=<<POSTGRESDB_SERVER>> -e POSTGRES_PORT=<<POSTGRESDB_PORT>> -e POSTGRES_DATABASE=<<DATABASE_NAME>> -e POSTGRES_USERNAME=<<DATABASE_USERNAME>> -e POSTGRES_PASSWORD=<<DATABASE_PW>> -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> --rm adhook/docker-postgres-s3-backup

    
