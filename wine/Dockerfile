FROM webvnc/base

# Install wine
ARG WINEBRANCH="stable"
RUN wget -nv -O- https://dl.winehq.org/wine-builds/winehq.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - \
    && apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(grep VERSION_CODENAME= /etc/os-release | cut -d= -f2) main" \
    && apt-get update \
    && apt-get install -y --install-recommends winehq-${WINEBRANCH} \
    && rm -rf /var/lib/apt/lists/*

# Download gecko and mono installers
COPY downloads.sh downloads.sh
RUN ./downloads.sh "$(dpkg -s wine-${WINEBRANCH} | grep "^Version:\s" | awk '{print $2}' | sed -E 's:^([0-9]+\.[0-9]+).*$:\1:g')" \
    && rm -f ./downloads.sh

# Install winetricks
RUN wget -nv -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
    && chmod +x /usr/bin/winetricks

# Setup environment
COPY xrun.sh /usr/bin/xrun

ENV WINEPREFIX /wine32
ENV WINEARCH win32

RUN xrun wineboot --init
RUN xrun winetricks -q corefonts
