# PHP load balanced demo

Demo of load balancing a PHP setup. It uses redis to handle the PHP session.

## Containers

* 2 nginx nodes
* 1 nginx as load balancer
* 1 php-fpm
* 1 redis
* 1 mysql

## About php-fpm

The docker/php8.0-nginx/Dockerfile installs the required modules, including the php-redis module.

The file docker/conf/php/php.ini configures PHP to handle session using redis, by pointing to the redis container.

## Some ports

Accessible ports through localhost:

* redis-stack: 8003
* Load balancer: 8080

## Known bugs

* Add index.php to the URL when browsing... Fallback to index.php is not working.
