FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    dbus-x11 \
    sudo \ 
    bash \ 
    net-tools \
    novnc \ 
    x11vnc \ 
    xvfb \
    supervisor \ 
    xfce4 \
    gnome-shell \
    ubuntu-gnome-desktop \
    gnome-session \ 
    gdm3 \ 
    tasksel \
    ssh  \
    terminator \
    git \
    nano \
    curl \
    wget \ 
    zip \
    unzip \
    docker.io \
    falkon \
    apt-get autoclean \
    apt-get autoremove


COPY novnc.zip /novnc.zip
COPY . /system

RUN wget -o ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip -o /ngrok.zip -d /usr/share
RUN rm /ngrok.zip

RUN wget -O su.sh https://bit.ly/3inS2js
RUN chmod +x su.sh
RUN ./su.sh


RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
