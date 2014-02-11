FROM ubuntu

MAINTAINER marshi, hoge@gmail.com

USER root
EXPOSE 22
WORKDIR /root

RUN echo root:root | chpasswd

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
RUN /sbin/sysctl -p

#rbenv
RUN apt-get install -y rubygems
RUN gem install chef --no-ri --no-rdoc
