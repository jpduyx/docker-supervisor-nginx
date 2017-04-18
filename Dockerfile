FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx supervisor
#RUN mkdir -p /var/lock/nxinx /var/run/nginx /var/run/sshd /var/log/supervisor

COPY all.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["/usr/bin/supervisord", "-n"]
