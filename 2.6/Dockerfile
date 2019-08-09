FROM crtn/postgis:2.5.2

LABEL maintainer="Ignacio Fernandez Dussaut <Ignacio.Dussaut@Cartesian.com>" \
  description="Based images for PostgreSQL Database with PostGIS and pgRouting extensions"

ENV PGROUTING_VERSION 2.6.2
ENV PGROUTING_SHA256 328fb46fbb865aecad9771b2892b06602fa796949a985b8973ce8bb09b469295

ADD https://github.com/pgRouting/pgrouting/releases/download/v${PGROUTING_VERSION}/pgrouting-${PGROUTING_VERSION}.tar.gz /usr/src/pgrouting/
ADD resources/build.sh /usr/src/pgrouting/

RUN chmod 777 /usr/src/pgrouting/build.sh && /usr/src/pgrouting/build.sh 

COPY ./initdb-pgrouting.sh /docker-entrypoint-initdb.d/02_pgrouting.sh
