FROM centos

MAINTAINER marshi, hoge@gmail.com

USER root
EXPOSE 22
WORKDIR /root

RUN echo root:root | chpasswd

RUN yum -y update
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" -C ""
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N "" -C ""
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
RUN /sbin/sysctl -p
