FROM ubuntu:19.04
MAINTAINER dc (dcrampton@gmail.com)
ENV HUBROOT=/hub
ENV SERVERBIN=$HUBROOT/server/LinuxServer/Engine/Binaries/Linux
ENV ENGINECFG=$HUBROOT/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Engine.ini
ENV GAMECFG=$HUBROOT/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Game.ini
ENV RULESJSON=$HUBROOT/server/LinuxServer/UnrealTournament/Saved/Config/Rulesets/DefaultRules_disable.json
ENV PAKSDIR=$HUBROOT/server/LinuxServer/UnrealTournament/Content/Paks
ENV PAKSEEDDIR=/pakseed
ENV SERVERNAME="SF UT+ UTPugs [Test Hub]"
ENV SERVERMOTD="This is a test server!"
ENV SERVERRCON="asdf1234"
ADD https://dc.wtf/ut/server.tar.gz /hub/
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
COPY script /hub/script/
RUN mkdir /pakseed
VOLUME /pakseed
RUN /hub/script/root.sh
RUN groupadd -g 999 hubadmin && useradd -r -u 999 -g hubadmin hubadmin
RUN chown -R hubadmin /hub
RUN chown -R hubadmin /pakseed
USER hubadmin
RUN /hub/script/hubadmin.sh
WORKDIR /hub
CMD ["/hub/script/startup.sh"]

