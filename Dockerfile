FROM fedora:40

RUN dnf group install Xfce -y
RUN dnf install tigervnc-server -y

# Setup VNC server
RUN mkdir /root/.vnc \
    && echo "" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

RUN touch /root/.Xauthority
ENV RESOLUTION=1920x1080

COPY entry.sh .
RUN  chmod +x entry.sh

CMD [ "/bin/bash", "/entry.sh" ]
