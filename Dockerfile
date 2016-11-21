FROM php:5.6-apache

RUN usermod -u 1000 www-data

EXPOSE 80
