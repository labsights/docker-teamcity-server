FROM labsights/base
MAINTAINER Sorin <sorin@labsights.com>

EXPOSE 80
ENV TEAMCITY_DATA_PATH /data/teamcity
VOLUME ["/data/teamcity"]

ADD playbooks /opt/ansible-playbooks
RUN ansible-playbook /opt/ansible-playbooks/setup.yml

WORKDIR /opt/teamcity-server

ENTRYPOINT bash bin/teamcity-server.sh run
