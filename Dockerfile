FROM ubuntu:16.04

MAINTAINER Paul Rohja Lesellier <rohja@rohja.com>

ENV AWS_REGION us-west-1

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends apt-transport-https curl ca-certificates wget unzip && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
RUN curl https://s3.dualstack.us-west-1.amazonaws.com/aws-xray-assets.us-west-1/xray-daemon/aws-xray-daemon-linux-2.x.zip -o ./aws-xray-daemon-linux-2.x.zip
RUN unzip -o aws-xray-daemon-linux-2.x.zip -d .
RUN mv xray /usr/bin/xray-daemon
CMD xray-daemon -f /var/log/xray-daemon.log --bind=0.0.0.0:2000
EXPOSE 2000/udp
