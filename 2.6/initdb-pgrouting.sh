#!/bin/sh
set -e

# Perform all actions as user $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Add pgRouting Functions to the database, Disable US Tiger Geocoder
echo "Loading PostGIS extensions into $PGDATABASE"
psql --dbname="$PGDATABASE" <<-'EOSQL'
  CREATE EXTENSION IF NOT EXISTS pgrouting CASCADE;
EOSQL

sed -ri "s!^#?(include_dir)\s*=.*!\1 = '/usr/src/postgresql/conf.d'!" /var/lib/postgresql/data/postgresql.conf