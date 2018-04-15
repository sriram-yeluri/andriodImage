# Docker file for android build machine image
FROM centos:centos7
MAINTAINER SriramYeluri <yeluris@gmail.com>

ENV JAVA_HOME=/opt/java \
 JAVA_VERSION_MAJOR=8 \
 JAVA_VERSION_MINOR=161 \
 JAVA_VERSION_BUILD=12 \
 DOWNLOAD_KEY=2f38c3b165be4555a1fa6e98c45e0808

RUN yum install -y \
  curl tar \
  && yum clean all

RUN echo ${JAVA_HOME}

# Install Oracle JDK
RUN mkdir -p /opt \
  && curl -L -b "oraclelicense=a" \
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${DOWNLOAD_KEY}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
  | gunzip \
  | tar -x -C /opt \
  && ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JAVA_HOME}
  
