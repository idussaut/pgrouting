#!/usr/bin/env bash

set -eux

apt-get update

# Required dependencies
apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    ca-certificates \
    cmake \
    curl \
    g++ \
    libcgal-dev \
    libboost-graph-dev \
    libtool \
    unzip

# pgRouting
cd /usr/src/pgrouting

echo "${PGROUTING_SHA256}" *pgrouting-${PGROUTING_VERSION}.tar.gz | sha256sum -c -

tar --extract --file pgrouting-${PGROUTING_VERSION}.tar.gz --gzip --strip-components 1 
rm pgrouting-${PGROUTING_VERSION}.tar.gz
mkdir build 
cd build 
cmake .. 
make install
ldconfig
rm -fr /usr/src/pgrouting/*


mkdir -p /docker-entrypoint-initdb.d

# Creating directory to modify PostgreSQL configuration
mkdir -p /usr/src/postgresql/conf.d
chown -R postgres:postgres /usr/src/postgresql/conf.d 
chmod 777 /usr/src/postgresql/conf.d