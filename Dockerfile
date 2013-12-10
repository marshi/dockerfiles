MAINTANER mukai_masaki, mashi3648@gmail.com

FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo root:root | chpasswd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
USER root

#RUN apt-get install -y memcached
#ENTRYPOINT ["memcached"]
#USER daemon
EXPOSE 11211 22

