FROM 3dpro/openssh
MAINTAINER Kittipun Khantitrirat <boot191@gmail.com>

# Apache2.4 + wsgi + web.py
ADD build-files /build-files
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && \
    apt-get -y install software-properties-common && \
    mv /build-files/ondrej-apache2.list /etc/apt/sources.list.d/ && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get -y install openssl curl apache2 apache2-utils && \
    mv /build-files/start.sh /start.sh && \
    chown root:root /start.sh && \
    chmod 755 /start.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy

ENV ALLOW_OVERRIDE **False**

VOLUME ["/var/log","/etc/apache2"]

EXPOSE 80 443
CMD ["/start.sh"]
