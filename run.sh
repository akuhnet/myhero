RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc  x11vnc xvfb supervisor xfce4 gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh terminator git nano curl wget zip unzip docker.io falkon
RUN apt-get autoclean
RUN apt-get autoremove
