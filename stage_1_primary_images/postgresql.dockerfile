FROM tomcat:8.5

ENV ROOTDIR /usr/local/
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR
ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8

# Install basic dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    sqlite3 \
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

#Install PostgreSQL 9.6
RUN apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update && apt-get install -y apt-utils apt-transport-https ca-certificates \
    && apt-get -y -q install postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6

ARG BUILD_DATE=unknown
ARG TRAVIS_COMMIT=unknown

LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="Web, GIS and image processing Docker Image" \
          org.label-schema.description="SGS Docker image for Web, GIS and image processing" \
          org.label-schema.url="https://hub.docker.com/r/autimio/tomcat-postgresql" \
          org.label-schema.vcs-ref=$TRAVIS_COMMIT \
          org.label-schema.vcs-url="https://github.com/autimio/docker-image-web-gis-imageprocessing" \
          org.label-schema.vendor="Autímio Meira Brito Filho" \
          org.label-schema.version=$TRAVIS_COMMIT \
          org.label-schema.schema-version="1.0"