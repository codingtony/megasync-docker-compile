FROM ubuntu:16.10
RUN apt-get update -y
RUN apt-get install -y build-essential autoconf automake m4 libtool qt4-qmake make libqt4-dev libcrypto++-dev libsqlite3-dev libc-ares-dev libnautilus-extension-dev 
RUN apt-get install -y git libssl-dev libtool-bin unzip autoconf m4 make wget && mkdir /tmp/git &&  cd /tmp/git && git clone -b v3.0.1.0_Linux  https://github.com/meganz/MEGAsync.git && cd MEGAsync && git submodule update --init --recursive
RUN mkdir -p /tmp/megasdkbuild && wget https://download.libsodium.org/libsodium/releases/old/libsodium-1.0.8.tar.gz -O /tmp/megasdkbuild/sodium-1.0.8.tar.gz
RUN apt-get install -y libcurl4-openssl-dev && cd /tmp/git/MEGAsync/src && ./configure -e -g -q -z 
RUN cd /tmp/git/MEGAsync/src && qmake "CONFIG+=with_ext" MEGA.pro && lrelease MEGASync/MEGASync.pro && make 
WORKDIR /tmp/git/MEGAsync/src 
ADD install.sh /usr/bin/
CMD install.sh
VOLUME /install
