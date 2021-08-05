FROM centos:7

LABEL org.opencontainers.image.authors="stevenchenworking@gmail.com"

USER root

ENV JAVA_VERSION=${JAVA_VERSION:-1.8.0}
ENV MAVEN_VERSION=x${MAVEN_VERSION:-3.8.1}

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk
ENV MAVEN_HOME=/usr/opt/maven
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:.

RUN mkdir -p /usr/opt
WORKDIR /usr/opt

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    # install java
    yum update -y && yum install -y java-${JAVA_VERSION}-openjdk-devel.x86_64 && yum clean all && \
    # install maven
    curl --retry 10 -S -L -O https://apache.website-solution.net/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -vxf apache-maven-${MAVEN_VERSION}-bin.tar.gz && mv apache-maven-${MAVEN_VERSION} maven && rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

CMD ["/bin/bash"]