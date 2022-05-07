# PHP load balanced demo

Demo of load balancing a PHP setup using redis to handle the PHP session. The purpose of this project is **to play**
with a load balancer setup to serve a PHP application.

## Containers

* 2 nginx nodes
* 2 php-fpm
* 1 nginx as load balancer
* 1 redis
* 1 mysql

## About php-fpm

The docker/php8.0-nginx/Dockerfile installs the required modules, including the php-redis module.

The file docker/conf/php/php.ini configures PHP to handle session using redis, by pointing to the redis container.

## Some ports

Accessible ports through localhost:

* redis-stack: 8003
* Load balancer: 8080

## Structure
```
└── docker
   ├── conf
   │  ├── mysql
   │  └── initdb
   │  ├── nginx
   │  │   ├── node1
   │  │   └── node2
   │  └── php
   ├── php8.0-nginx
   └── volumes
       ├── app
       ├── backups
       ├── log
       │   ├── lb
       │   ├── node1-nginx
       │   └── node2-nginx
       ├── mysql-data
       ├── redis-data
       ├── www
       └── wwwdata
```

## Known bugs

* Fallback to index.php is not working.

## Running

After `docker-compose up -d --build` (on Windows you may use `docker compose up -d --build`) there will be 7 cotainers running.
Browse to http://localhost:8080 . You should see a '1' on the page. Reload several times to increase to number shown.

Check the access nodeX-nginx access logs and half of the request must be shown on each file.

Also, http://localhost:8003 should show a PHPREDIS_SESSION containing the session data.

You can fire a second browser or an incognito tab to get another session.