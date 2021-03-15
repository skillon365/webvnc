FROM webvnc/wine

ADD supervisord.conf supervisord.conf
RUN cat supervisord.conf >> /etc/supervisor/conf.d/supervisord.conf \
    && rm -f supervisord.conf
