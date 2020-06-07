# docker-php-cli

PHP 7.3 cli and `composer` in a docker container, with MySQL and database drivers installed. Use with Laravel's `php artisan` (including `php artisan serve`) and others.

# Usage

Build with:
```
docker build --tag docker-php-cli https://github.com/pascalchristian/docker-php-cli.git
```

Then execute to get shell access at current directory:
```
docker run -it \
-v $PWD:/app \
-p 8000:8000 \
-e PUID=1000 \
-e PGID=1000 \
docker-php-cli
```

`PUID` and `PGID` environment variable can be included to have the script run as your current user and preserve permission. Otherwise, default to `PUID=1000` and `PGID=1000`. 
