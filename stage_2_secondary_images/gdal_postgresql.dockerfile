FROM autimio/tomcat-gdal:latest

#Install PostgreSQL 9.6
RUN apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update && apt-get install -y apt-utils apt-transport-https ca-certificates \
    && apt-get -y -q install postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6

ARG BUILD_DATE=unknownnpm
ARG TRAVIS_COMMIT=unknown

LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="Web, GIS and image processing Docker Image" \
          org.label-schema.description="SGS Docker image for Web, GIS and image processing" \
          org.label-schema.url="https://hub.docker.com/r/autimio/tomcat-gdal" \
          org.label-schema.vcs-ref=$TRAVIS_COMMIT \
          org.label-schema.vcs-url="https://github.com/autimio/docker-image-web-gis-imageprocessing" \
          org.label-schema.vendor="Autímio Meira Brito Filho" \
          org.label-schema.version=$TRAVIS_COMMIT \
          org.label-schema.schema-version="1.0"