FROM raspbian/jessie:latest

RUN apt-get update

RUN apt-get install apt-transport-https ca-certificates software-properties-common -y
RUN curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
RUN usermod -aG docker pi
RUN curl https://download.docker.com/linux/raspbian/gpg
RUN echo "\ndeb https://download.docker.com/linux/raspbian/ stretch stable" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN systemctl start docker.service
RUN docker info

RUN apt-get install -y apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat software-properties-common

RUN curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install" | bash -s -- -m raspberrypi4 -d "/sharedfolders/AppData/HA"

CMD systemctl start hassio-supervisor.service
