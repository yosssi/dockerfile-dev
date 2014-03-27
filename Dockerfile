# yosssi/dev
#
# VERSION 1.0.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu

MAINTAINER Keiji Yoshida, yoshida.keiji.84@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install make curl
RUN apt-get install -y make curl

# install libraries
RUN apt-get install -y gcc libssl-dev libcurl4-openssl-dev libexpat1 libexpat1-dev build-essential tcl8.4 tk8.4 gettext

# install git
RUN curl -o /usr/local/v1.9.1.tar.gz https://codeload.github.com/git/git/tar.gz/v1.9.1
RUN tar -C /usr/local -xzf /usr/local/v1.9.1.tar.gz
RUN rm /usr/local/v1.9.1.tar.gz
RUN cd /usr/local/git-1.9.1; make; make install
RUN rm -r /usr/local/git-1.9.1

# install Go 1.2.1
RUN curl -o /usr/local/go1.2.1.linux-amd64.tar.gz https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /usr/local/go1.2.1.linux-amd64.tar.gz
RUN rm /usr/local/go1.2.1.linux-amd64.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/go
ENV PATH $PATH:$GOPATH/bin:$GOROOT:$GOROOT/bin
