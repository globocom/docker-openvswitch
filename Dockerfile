FROM alpine:latest


# Install dependencies
RUN apk --update add openssh \
                     supervisor \
                     openvswitch


# ////////////// SSH Section ////////////// #

# Creates ssh keys to run sshd service
RUN /usr/bin/ssh-keygen -t rsa -b 4096 -N '' -f /etc/ssh/ssh_host_rsa_key

# Allow root to login over ssh with no password
RUN sed -i 's,#PermitRootLogin.*$,PermitRootLogin yes,1' /etc/ssh/sshd_config
RUN sed -i 's/#PermitEmptyPasswords.*$/PermitEmptyPasswords yes/1' /etc/ssh/sshd_config

# Exposes SSH port
EXPOSE 22


# ////////////// Open vSwitch Section ////////////// #

# Create database and pid file directory
RUN /usr/bin/ovsdb-tool create /etc/openvswitch/conf.db
RUN mkdir -pv /var/run/openvswitch/


# Add supervisord configuration file
ADD supervisord.conf /etc/supervisord.conf


# When container starts, supervisord is executed
ENTRYPOINT /usr/bin/supervisord
