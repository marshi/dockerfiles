MAINTANER marshi, hoge@gmail.com
 
FROM ubuntu

USER root
EXPOSE 22
WORKDIR /root

RUN echo root:root | chpasswd

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

RUN apt-get install -y git

#rbenv
RUN apt-get install -y build-essential bison libreadline6-dev curl git-core zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libncurses5-dev
RUN git clone git://github.com/sstephenson/rbenv.git .rbenv
RUN mkdir /root/.rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV RBENV_ROOT /root/.rbenv
ENV PATH $RBENV_ROOT/shims:$RBENV_ROOT/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN rbenv install 2.1.0
RUN rbenv global 2.1.0
RUN rbenv rehash
RUN gem install chef --no-ri
