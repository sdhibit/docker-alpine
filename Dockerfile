FROM alpine:3.4
MAINTAINER Steve Hibit <sdhibit@gmail.com>

# Add Repositories
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Install runit & helpful packages
RUN apk --update upgrade \
 && apk --no-cache add \
  curl \
  runit@community \
  su-exec 

ADD start_runit /sbin/

RUN chmod a+x /sbin/start_runit \
 && mkdir -p /etc/container_environment \
    /etc/service \
    /etc/runit_init.d 

CMD ["/sbin/start_runit"]
