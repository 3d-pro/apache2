# Apache 2.4 /w OpenSSL 1.0.2 image of Debian Jessie [![Build Status](https://travis-ci.org/3d-pro/apache2.svg?branch=master)](https://travis-ci.org/3d-pro/apache2)

## Required Docker Images
- openssh

## Build
```
  docker build -t apache2:latest .
```
## Run
```
  docker run -d -p 8080:80 -p 4433:443 -h apache2 --name apache2 apache2:latest
```
