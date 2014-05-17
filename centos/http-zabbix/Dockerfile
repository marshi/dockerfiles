FROM marshi/centos-ssh

MAINTAINER marshi, mashi3648@gmail.com

USER root
EXPOSE 22 80 10050 7373 7947
WORKDIR /root

RUN yum install -y python-setuptools httpd
RUN easy_install supervisor
RUN mkdir /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf

RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y zabbix22-agent.x86_64
RUN sed -i -e 's/^\(Server=.*\)/#\1\nServer=10.34.48.194/' /etc/zabbix_agentd.conf
RUN sed -i -e 's/^\(Server=.*\)/#\1\nServer=10.34.48.194/' /etc/zabbix_agent.conf

ADD serf /usr/local/bin/serf

CMD ["/usr/bin/supervisord"]

