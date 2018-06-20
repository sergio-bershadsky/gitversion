FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y mono-complete libcurl3 wget unzip git

WORKDIR /tmp

RUN wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.13/GitVersion_4.0.0-beta0013.zip

RUN unzip GitVersion_4.0.0-beta0013.zip -d /opt/GitVersion

WORKDIR /repository

ENTRYPOINT ["mono", "/opt/GitVersion/GitVersion.exe"]