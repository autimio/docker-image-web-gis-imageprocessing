FROM tomcat:8.5

ENV ROOTDIR /usr/local
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR
ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8

# Install basic dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    wget \
    bash-completion \
    cmake \
    software-properties-common \
    net-tools \
    --reinstall procps \
    curl \
    default-jdk \
    git \
    maven

# Configure timezone and locale
RUN apt-get update \
    && apt-get install --reinstall -y locales \
    && sed -i 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen pt_BR.UTF-8  \
    && dpkg-reconfigure --frontend noninteractive locales

# Compile and install GDAL and GrassGis
RUN apt-get -y install grass grass-dev \
    && apt-get update

ARG BUILD_DATE=unknown
ARG TRAVIS_COMMIT=unknown

LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="Web, GIS and image processing Docker Image" \
          org.label-schema.description="SGS Docker image for Web, GIS and image processing" \
          org.label-schema.url="https://hub.docker.com/r/autimio/tomcat-grass" \
          org.label-schema.vcs-ref=$TRAVIS_COMMIT \
          org.label-schema.vcs-url="https://github.com/autimio/docker-image-web-gis-imageprocessing" \
          org.label-schema.vendor="Autímio Meira Brito Filho" \
          org.label-schema.version=$TRAVIS_COMMIT \
          org.label-schema.schema-version="1.0"