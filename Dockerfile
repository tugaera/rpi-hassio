FROM raspbian/jessie:latest

RUN apt-get update && apt-get install -y apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat software-properties-common

RUN curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install" | bash -s -- -m raspberrypi4 -d "/sharedfolders/AppData/HA"

