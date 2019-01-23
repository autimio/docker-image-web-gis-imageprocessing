FROM tomcat:8.5

# Compile and install GDAL and GrassGis
RUN apt-get -y install grass grass-dev \ 
    && apt-get update

ARG BUILD_DATE=unknown
ARG TRAVIS_COMMIT=unknown

LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="Web, GIS and image processing Docker Image" \
          org.label-schema.description="SGS Docker image for Web, GIS and image processing" \
          org.label-schema.url="https://hub.docker.com/r/autimio/gdal" \
          org.label-schema.vcs-ref=$TRAVIS_COMMIT \
          org.label-schema.vcs-url="https://github.com/autimio/docker-image-web-gis-imageprocessing" \
          org.label-schema.vendor="Autímio Meira Brito Filho" \
          org.label-schema.version=$TRAVIS_COMMIT \
          org.label-schema.schema-version="1.0"