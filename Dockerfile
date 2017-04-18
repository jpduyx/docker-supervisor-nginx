FROM ubuntu:16.04
MAINTAINER JPDuyx based on lukptr <lukptr@ridhosribumi.com>
ENV  DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y nginx supervisor \
 && apt-get -y clean autoclean \
 && apt-get -y autoremove \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
 && mkdir -p /var/cache/nginx /var/log/nginx \
 && chmod 777 /var/cache/nginx /var/log/nginx 

COPY all.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["/usr/bin/supervisord", "-n"]
