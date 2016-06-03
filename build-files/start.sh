#!/bin/bash
chown www-data:www-data /var/www/html -R

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

cron
service rsyslog start
service ssh start
service apache2 start
tail -F /var/log/apache2/*
