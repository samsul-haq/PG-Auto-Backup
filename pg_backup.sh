1. Step create /root/.pgpass
Example- 
localhost:PORT:DATABASE:USER:PASSWORD
127.0.0.1:5352:db_example:<postgres username>:<your pgsql passwor>

2. change to permission
chmod 0600 ~/.pgpass

3. create script file like- pg_backup.sh

vim /root/pg_backup.sh

#!/bin/bash
# This script will backup the postgresql database
# and store it in a specified directory

# Constants

USER="postgres"
DATABASE="db_example"
HOST="127.0.0.1"
PORT="5352"
BACKUP_DIRECTORY="<save database directory path>"

# Date stamp (formated YYYYMMDD)
# just used in file name
CURRENT_DATE=$(date "+%Y%m%d")

# Database named (command line argument) use pg_dump for targed backup
pg_dump -h $HOST -d $DATABASE -p $PORT -U $USER -w -C -F c -v > $BACKUP_DIRECTORY/$DATABASE\_$CURRENT_DATE.backup

# Database named (command line argument) use pg_dump for targed compress gz
#pg_dump -U $USER $DATABASE -h $HOST -p $PORT | gzip - > $BACKUP_DIRECTORY/$DATABASE\_$CURRENT_DATE.sql.gz

# Cleanup old backups
#find $BACKUP_DIRECTORY/* -mtime +7 -exec rm {} \;

save file.

4. chmod 700 /root/pg_backup.sh

Now Enjoy..
