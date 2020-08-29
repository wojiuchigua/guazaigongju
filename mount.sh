#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#=========================================================
#       onautomationem Required: Centos 6/7,Ubuntu 16/18
#       Description: replace software source script
#       Version: 1.0
#       Author: wojiuchigua
#       Website: blog.cloudyun.xyz
#=========================================================
source /etc/os-release

startsh(){
echo -e "暂时只写oss的,cos之类的以后再写"

echo -e "输入bucket"
read bucket

echo -e "输入access-key-id"
read id

echo -e "输入access-key-secre"
read secret

ubuntush
}

ubuntush(){
if [ "${ID}" = "ubuntu" ];then
sudo apt install libfuse-dev libssl-dev libxml2-dev make pkg-config automake autotools-dev g++ git libcurl4-gnutls-dev -y 
installsh
else
centossh
fi
}
centossh(){
if [ "${ID}" = "centos" ];then
sudo yum install automake gcc-c++ git libcurl-devel libxml2-devel  fuse-devel make openssl-devel -y
installsh
else
echo -e "懒得写了,不过有需要可以让我加上去,通过编译安装很简单的只不过不同的系统我不知道该用哪些软件包,这个脚本纯属是为了偷懒用的"
fi
}
installsh(){
git clone https://github.com/aliyun/ossfs.git
cd ossfs
./autogen.sh
./configure
make
sudo make install
echo ${bucket}:${id}:${secret} > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
echo -e "安装完成"
}

startsh
