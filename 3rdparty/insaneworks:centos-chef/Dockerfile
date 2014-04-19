FROM insaneworks/centos:latest
MAINTAINER Kota Shiratsuka <kota@insaneworks.co.jp>

RUN sysctl -w vm.overcommit_memory=1
RUN curl -L https://www.opscode.com/chef/install.sh | bash
