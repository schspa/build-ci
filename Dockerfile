FROM ubuntu:18.04

COPY ./sources.list /etc/apt/

RUN apt-get update && apt-get install -y \
	adb \
	android-tools* \
	ca-certificates \
	curl \
	fastboot \
	usbutils \
	wget \
	make git gcc pkg-config bison flex libncurses5-dev zlib1g-dev fakeroot wget bzip2 \
	python-numpy bc cmake build-essential\
    gcc-aarch64-linux-gnu \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir src
COPY ./dtc-1.6.0.tar.gz src/
RUN cd src && tar -xzvf dtc-1.6.0.tar.gz && cd dtc-1.6.0 && make && make PREFIX=/usr/local install
RUN rm -rf src/dtc*
