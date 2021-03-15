FROM webvnc/wine

RUN wget https://github.com/LibreCAD/LibreCAD/releases/download/2.1.3/LibreCAD-Installer-2.1.3.exe \
    && xrun wine ./LibreCAD-Installer-2.1.3.exe /S \
    && rm -f LibreCAD-Installer-2.1.3.exe

ADD supervisord.conf supervisord.conf
RUN cat supervisord.conf >> /etc/supervisor/conf.d/supervisord.conf \
    && rm -f supervisord.conf
