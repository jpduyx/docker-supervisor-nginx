FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server nginx supervisor
RUN mkdir -p /var/lock/nxinx /var/run/nginx /var/run/sshd /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
