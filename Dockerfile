FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /run
COPY run.sh /run
WORKDIR /run
RUN chmod +x run.sh
RUN ./run.sh



COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
