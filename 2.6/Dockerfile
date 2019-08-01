FROM crtn/postgis:11.4-2.5.2

LABEL maintainer="Ignacio Fernandez Dussaut <Ignacio.Dussaut@Cartesian.com>" \
  version="0.02" \
  os="debian:stretch-slim" \
  tools="PostgreSQL=11.4, PostGIS=2.5, pgRouting=2.6.2" \
  description="Based images for PostgreSQL Database with PostGIS and pgRouting extensions"

ENV PGROUTING_MAJOR 2.6
ENV PGROUTING_VERSION 2.6.2

RUN apt-get update \
  # Required dependencies
  && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    ca-certificates \
    cmake \
    curl \
    g++ \
    libcgal-dev \
    libboost-graph-dev \
    libtool \
    unzip \
  # pgRouting
  && [ -d /usr/local/bin/pgrouting ] || mkdir -p /usr/local/bin/pgrouting \
  && wget -P /usr/local/bin/pgrouting/ "https://github.com/pgRouting/pgrouting/releases/download/v$PGROUTING_VERSION/pgrouting-$PGROUTING_VERSION.tar.gz" \
  && cd /usr/local/bin/pgrouting \
  && tar xvzf pgrouting-$PGROUTING_VERSION.tar.gz \
  && cd pgrouting-$PGROUTING_VERSION \
  && mkdir build && cd build && cmake .. && make install \
  && rm -fr /usr/local/bin/pgrouting


RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-pgrouting.sh /docker-entrypoint-initdb.d/pgrouting.sh
