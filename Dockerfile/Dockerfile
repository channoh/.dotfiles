FROM ubuntu:20.04
MAINTAINER Channoh Kim <channoh@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive

## Set environment variables
ENV GIT_SSL_NO_VERIFY 1
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        wget \
        git \
        cmake \
        vim \
        tmux \
        exuberant-ctags \
        tree \
        python \
        python-numpy \
        locales \
        && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

RUN cd /root && git clone https://github.com/channoh/.dotfiles.git && bash /root/.dotfiles/install.sh

WORKDIR /work
