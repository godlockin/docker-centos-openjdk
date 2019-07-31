FROM centos:7

MAINTAINER godlockin <stevenchenworking@gmail.com>

USER root

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk

ENV PATH=$PATH:$JAVA_HOME/bin:.

RUN yum update -y && \
    yum install -y java-1.8.0-openjdk-devel && \
    yum clean all && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["/bin/bash"]
