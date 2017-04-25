FROM alpine:3.5
MAINTAINER Steve Hibit <sdhibit@gmail.com>

# Add Repositories
#RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install runit & helpful packages
RUN apk --update upgrade \
 && apk add \
  curl \
  runit \
  su-exec \
 && rm -rf /var/cache/apk/*

ADD start_runit /sbin/

RUN chmod a+x /sbin/start_runit \
 && mkdir -p /etc/container_environment \
    /etc/service \
    /etc/runit_init.d 

CMD ["/sbin/start_runit"]
