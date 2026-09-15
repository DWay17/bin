#!/bin/sh
# pg_sql.sh
psql -d myDataBase -a -f myInsertFile
psql -d openbis_test | tee 
