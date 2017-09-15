#!/bin/sh

mkdir -p ~/yum_bake/
mv /etc/yum.repos.d/* ~/yum_bake/
mv ../CentOS-Base.repo /etc/yum.repos.d/

yum -y update
yum -y groupinstall 'Development Tools'
# make sure i dont miss any thing 
yum install -y cmake wget gmp-devel mpfr-devel libmpc-devel golang clang c-ares-devel

# we need latest version of the git for the build hence will remove the existing version
yum -y remove  git 


# Directory that will have envoy tools
mkdir -p /opt/envoy_env

cd /opt/envoy_env
unzip ./install_files/git-2.10.1.zip
cd git-2.10.1
make configure
./configure --prefix=/usr/local/git-2.10.1
make all
make install