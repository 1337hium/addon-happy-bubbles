#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Happy Bubbles
# Configures NGINX for use with the Happy Bubbles presence server
# ==============================================================================
declare certfile
declare keyfile

if bashio::config.true 'ssl'; then
    rm /etc/nginx/nginx.conf
    mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx.conf
fi
