FROM marshi/centos-ssh

MAINTAINER marshi, mashi3648@gmail.com

RUN yum install -y git
RUN yum install -y wget
RUN yum install -y tar
RUN yum install -y gcc openssl-devel
RUN yum remove -y ruby

RUN wget https://gist.githubusercontent.com/marshi/8913675/raw/dc8507b1712c64e8510c3d72892cf2fe5ee1051a/rbenv_syswide.sh
RUN sh rbenv_syswide.sh root
RUN sh -c -l "rbenv install 2.1.1"
RUN sh -c -l "rbenv global 2.1.1"
RUN sh -c -l "rbenv rehash"
ENV PATH $PATH:/usr/local/rbenv/shims/
RUN gem install chef --no-ri --no-rdoc
