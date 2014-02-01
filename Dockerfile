MAINTANER marshi, hoge@gmail.com
 
FROM ubuntu

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
USER root
EXPOSE 22 3000
WORKDIR /root

RUN echo root:root | chpasswd

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt-get install -y git

#rbenv
RUN git clone git://github.com/sstephenson/rbenv.git .rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .bash_profile
RUN echo 'eval "$(rbenv init -)"' >> .bash_profile
RUN source ~/.bash_profile
RUN rbenv install 2.1.0
RUN rbenv rehash
RUN rbenv global 2.1.0
