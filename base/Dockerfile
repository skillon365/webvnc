FROM ubuntu:focal

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /root

# Install prerequisites
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        cabextract \
        fluxbox \
        git \
        gnupg2 \
        gosu \
        gpg-agent \
        net-tools \
        novnc \
        p7zip \
        python-is-python2 \
        python2 \
        software-properties-common \
        supervisor \
        tar \
        tigervnc-standalone-server \
        tigervnc-xorg-extension \
        tzdata \
        unzip \
        websockify \
        wget \
        winbind \
        xdotool \
        xvfb \
        zenity \
    && rm -rf /var/lib/apt/lists/*

# Setup environment
COPY fluxbox.init /root/.fluxbox/init
COPY fluxbox.apps /root/.fluxbox/apps

# Setup novnc html
COPY index.html /usr/share/novnc/index.html

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV DISPLAY :0
EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
