FROM 3dpro/openssh

ADD build-files /build-files
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y openssl apache2 apache2-utils && \
    mv /build-files/start.sh /start.sh && \
    chown root:root /start.sh && \
    chmod 755 /start.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy

ENV ALLOW_OVERRIDE **False**

VOLUME ["/var/log"]

EXPOSE 80 443
CMD ["/start.sh"]
