FROM ubuntu:16.04
MAINTAINER JPDuyx based on lukptr <lukptr@ridhosribumi.com>

ENV  DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y nginx supervisor && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ /home/$FRAPPE_USER/.cache
#RUN mkdir -p /var/lock/nxinx /var/run/nginx /var/run/sshd /var/log/supervisor

COPY all.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["/usr/bin/supervisord", "-n"]
