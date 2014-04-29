FROM marshi/centos-ssh

MAINTAINER marshi, mashi3648@gmail.com

USER root
#EXPOSE 22 80
WORKDIR /root

RUN yum install -y python-setuptools httpd
RUN easy_install supervisor
RUN mkdir /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
