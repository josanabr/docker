FROM alpine
MAINTAINER John Sanabria - john.sanabria@correounivalle.edu.co
RUN apk add --no-cache git build-base python python-dev py-pip && pip install virtualenv && rm -rf /var/cache/apk/*
RUN mkdir /source
WORKDIR /source
RUN git clone https://github.com/josanabr/autotune.git
WORKDIR /source/autotune
RUN make install
