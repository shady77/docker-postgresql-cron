#!/bin/sh
sed -i '$ d' ${PGDATA}/postgresql.conf

cat <<EOT >> ${PGDATA}/postgresql.conf
shared_preload_libraries='pg_cron'
cron.database_name='${POSTGRES_DB:-postgres}'
EOT

pg_ctl restart
