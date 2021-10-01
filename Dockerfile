FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
	apt-get upgrade -y  && \
    apt install dbus-x11 -y  && \
    apt install sudo -y  && \ 
    apt install bash -y  && \ 
    apt install net-tools -y  && \
    apt install novnc -y  && \ 
    apt install x11vnc -y  && \ 
    apt install xvfb -y  && \
    apt install supervisor -y  && \ 
    apt install xfce4 -y  && \
    apt install gnome-shell -y  && \
    apt install lxde  && \
    apt install lxde-session -y  && \ 
    apt install gdm3 -y  && \ 
    apt install tasksel -y  && \
    apt install ssh  -y  && \
    apt install terminator -y  && \
    apt install git -y  && \
    apt install nano -y  && \
    apt install curl -y  && \
    apt install wget -y  && \ 
    apt install zip -y  && \
    apt install unzip -y  && \
	apt install docker.io -y && \
    apt install falkon -y  && \
    apt-get autoclean -y  && \
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
