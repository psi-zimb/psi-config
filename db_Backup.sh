#!/bin/sh -x
bahmni -i dbBackup backup --backup_type=db  --options=openmrs
bahmni -i dbBackup backup --backup_type=db  --options=openerp
bahmni -i dbBackup backup --backup_type=db  --options=clinlims
/usr/bin/find /data/openmrs -type f -mtime +7 -exec /bin/rm -f {} \;
/usr/bin/find /data/pgsql/openerp -type f -mtime +7 -exec /bin/rm -f {} \;
/usr/bin/find /data/pgsql/clinlims -type f -mtime +7 -exec /bin/rm -f {} \;
