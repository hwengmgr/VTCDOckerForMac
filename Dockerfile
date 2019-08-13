FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git build-essential curl python-pip libtool autoconf automake cmake libcap-dev libz-dev libbz2-dev pkg-config
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN mkdir -p proj && cd proj
WORKDIR /proj
COPY build-MacOSX-only.sh /proj/
