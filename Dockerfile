# yosssi/dev
#
# VERSION 1.0.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu

MAINTAINER Keiji Yoshida, yoshida.keiji.84@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install libraries
RUN apt-get install -y software-properties-common python-software-properties

# install make curl
RUN apt-get install -y make curl

# install git
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git
RUN git config --global user.email "yoshida.keiji.84@gmail.com"
RUN git config --global user.name "yosssi"
RUN git config --global core.editor "/usr/bin/vi"
RUN git config --global color.ui "true"

# install Go 1.2.1
RUN curl -o /usr/local/go1.2.1.linux-amd64.tar.gz https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /usr/local/go1.2.1.linux-amd64.tar.gz
RUN rm /usr/local/go1.2.1.linux-amd64.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH /host_home/go
ENV PATH $PATH:$GOPATH/bin:$GOROOT:$GOROOT/bin
