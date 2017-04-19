FROM ubuntu:16.04
MAINTAINER JPDuyx based on lukptr <lukptr@ridhosribumi.com>
ENV  DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y nginx supervisor \
 && apt-get -y clean autoclean \
 && apt-get -y autoremove \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
# VOLUME ["/var/cache/nginx"]

COPY all.conf /etc/supervisor/conf.d/
COPY nginx.conf /etc/nginx/

COPY index.html /usr/share/nginx/html/

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-n"]

# some inspiration from: https://github.com/nginxinc/openshift-nginx/blob/master/Dockerfile
