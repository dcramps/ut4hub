FROM ubuntu:19.04
MAINTAINER dc (dcrampton@gmail.com)
ADD https://dc.wtf/ut/server.tar.gz /hub/
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
COPY script /hub/script/
RUN /hub/script/root.sh
RUN groupadd -g 999 hubadmin && useradd -r -u 999 -g hubadmin hubadmin
RUN chown -R hubadmin /hub
USER hubadmin
RUN /hub/script/hubadmin.sh
WORKDIR /hub
CMD ["/hub/script/startup.sh"]

