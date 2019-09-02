# CHANGELOG

## develop

### New

* `ubuntu-18.04/network-lead` now gets its config file from `/config/dnsmasq.conf`

## 20190424.02

Released Wednesday, 24th April 2019.

### New

* Added `ubuntu-phpcli:7.2` image
* `ubuntu-nginx-phpdev:7.2` image
  - switched to v4 of the `phpredis` extension

## 20190424.01

Released Wednesday, 24th April 2019.

### New

* Added `network-lead:18.04` image
* Added `ubuntu-nodejs-dev-10:18.04` image
* `ubuntu-nginx-phpdev-7.2:18.04` image
  - added `php-redis` package
* Bump base image Docker to 18.09.5
* Bump base image kubectl to 1.13.1

## 20180808.01

Released Wednesday, 8th August 2018.

Includes latest Ubuntu package updates. Switched to a new date-based versioning scheme. I think it makes more sense.

### New

* Added `ubuntu-server:18-04` image
* Added `ubuntu-nginx:18.04` image
* Added `ubuntu-nginx-phpdev-7.2:18.04` image

### Maintenance

* All the older ubuntu 16.04-based images moved into subfolder
  - makes space for ubuntu 18.04-based images

## 3.7.0

Released Wednesday 25th April 2018.

Includes latest Ubuntu package updates!

### New

* Added `ubuntu-openjdk-dev-8` image
  - includes helper script developed by Apache OpenWhisk project
* Added `ubuntu-nodejs-dev-8` image
* Added `wget`, `docker` and `kubectl` to `ubuntu-server-16.04` image
  (which means they're now present in all other images)

### Fixes

* `image-startup.sh` now sources startup scripts
  - allows them to set environment variables to pass to container processes

## 3.6.0

Released Thursday 2nd November 2017.

### New

* Added `ubuntu-apache2-wordpress-dev` image
* Renamed `wordpress-dev` to be `ubuntu-nginx-wordpress-dev`
* Label on `ubuntu-nginx-wordpress-dev` is now `4.x`

### Fixes

* `ubuntu-apache2-modphp-dev`
  - removed any FPM-related packages
  - startup script now sets env vars correctly
  - added working opcache config

## 3.5.1

Released Monday 28th August 2017.

### Fixes

* Workaround for regressions in Jenkins
  - need to fetch tags manually now

## 3.5.0

Released Monday 28th August 2017.

### New

* Enabled 'universe' and 'multiverse' packages in `ubuntu-server-16.04`
  - needed for Apache2 + PHP support
* Added `vim` to `ubuntu-server-16.04`
* Added `ubuntu-apache2` image
* Added `ubuntu-apache2-phpfpm-dev` image
* Added `ubuntu-apache2-modphp-dev` image

### Fixes

- removed unused `IMAGES_DIR` from `Makefile.in`

## 3.4.0

Released Sunday 13th August 2017.

### New

* PHP-FPM timeout support
  - new `PHP_TIMEOUT` environment variable
  - added to `ubuntu-nginx-phpdev-7.0`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastcgi-prod`
  - inherited in `wordpress-dev`

### Security

* Ubuntu packages rebuilt with latest upstream security fixes

## 3.3.0

Released Monday 6th Mar 2017.

### Security

* Ubuntu packages for PHP have been updated

... + any other security fixes Ubuntu have pushed out since we tagged 3.2.0.

### New

* Added XML modules to PHP
  - added to `ubuntu-nginx-phpdev-7.0`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastci-prod`
  - inherited in `wordpress-dev`

### Fixes

* Force rebuild of images on CI

## 3.2.0

Released Tuesday 21st Feb 2017.

### New

* Initial Wordpress MultiUser support
  - added to `wordpress-dev`
* Report values used for `NGINX_*` variables on startup
  - added to `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev-7.0`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastcgi-prod`
  - inherited in `wordpress-dev`

## 3.1.0

Released Thursday 16th Feb 2017.

### New

* New image: `ubuntu-nginx-phpfpm-prod-7.0`
  - Ubuntu 16.04
  - NGINX
  - PHP-FPM 7.0
  - + production configuration
* New image: `ubuntu-nginx-phpfastcgi-prod-7.0`
  - Ubuntu 16.04
  - NGINX
  - 4 workers for `PHPFastCGI`
* Added PHP's package manager `composer`
  - added to `ubuntu-nginx-phpdev-7.0`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastcgi-prod`
  - inherited in `wordpress-dev`
* Added environment vars for the app's root folder
  - `NGINX_APP_ROOT` - path inside container to your webapp's root folder
  - use `NGINX_DEFAULT_APP_ROOT` in `Dockerfile` to set defaults
  - added to `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastcgi-prod`
  - inherited in `wordpress-dev`
* `NGINX_*` environment vars are now applied to the Supervisor config files too
  - added to `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev`
  - inherited in `ubuntu-nginx-phpfpm-prod`
  - inherited in `ubuntu-nginx-phpfastcgi-prod`
  - inherited in `wordpress-dev`

### Fixes

* Make `index.php` default index file for a folder
  - updated in `wordpress-dev`
* Log suspicious file access attempts
  - updated in `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev-7.0`
  - inherited in `wordpress-dev`

## 3.0.0

Released Thursday 9th Feb 2017.

### New

* Nginx default site is now the only one you need, controlled by new environment vars
  - `NGINX_SITE_ROOT` - path inside container to your website's root folder
  - `NGINX_APP_SITE_CONF` - path inside container to website-specific Nginx `server` config block
  - `NGINX_APP_SERVER_CONF` - path inside container to website-specific CGI/FPM et all support
  - use `NGINX_DEFAULT_SITE_ROOT`, `NGINX_DEFAULT_APP_SITE_CONF` and `NGINX_DEFAULT_APP_SERVER_CONF` in `Dockerfile` to set defaults
    - **IMPORTANT** - never set `NGINX_SITE_ROOT`, `NGINX_APP_SITE_ROOT` or `NGINX_APP_SERVER_CONF` in a `Dockerfile`
    - if you do, this overrides any attempt to set them in your `docker-compose.yml` file
  - `ubuntu-nginx` image defaults to static site in `/workspace/www`
  - `ubuntu-nginx-phpdev-7.0` image defaults to PHP-FPM site in `/workspace/app/public`
  - `wordpress-dev` image defaults to PHP-FPM Wordpress site in `/workspace/wordpress`

### Fixes

* `make build` no longer uses `--pull` switch
  - stops Docker ignoring any locally-build base image
* `make build` now depends on `make baseimage`
  - allows us to automatically keep our upstream deps up to date
* `wordpress-dev` startup script no longer tries to deactivate plugins that you've listed

### Tweaks

* Reduce number of layers in our base image
  - updated `ubuntu-server-16.04`

### Tools

* Added `bin/make-images.sh` and top-level `Makefile`
  - `make build` - build all images locally
  - `make publish` - build & publish locally-built images up to the hub
  - `make rebuild` - rebuild all images locally
  - `make republish` - rebuild & publish locally-built images up to the hub
* Added `make squash` (works in per-image folder)
  - *EXPERIMENTAL*, and may not produce a working image
* Added `make baseimage` (works in per-image folder)
  - pulls down latest base image *if* `UPDATE_BASE_IMAGE=always` is set in local `Makefile`
* Added `make pull` (works in per-image folder)
  - pulls down latest base image

## 2.2.0

Released Tuesday 31st Jan 2017.

### New

* `wordpress-dev`: helper wrapper around `wp-cli`
  - `/usr/bin/wp` is a helper wrapper that passes `--path` and `--allow-root` into `wp-cli` for you
* `wordpress-dev`: support auto-download, install of plugins on startup
* `sudo` command added (to run scripts as non-root in images)
  - added to `ubuntu-server`
  - inherited in `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev`
  - inherited in `network-lead`
  - inherited in `wordpress-dev`
* `make rebuild` added to top-level Makefile

## 2.1.0

Released Wednesday 25th Jan 2017.

### New

* `wordpress-dev` image added
* PHP memcached extension added
  - added to `ubuntu-nginx-phpdev`
* `ping` shell command added
  - added to `ubuntu-server`
  - inherited in `ubuntu-nginx`
  - inherited in `ubuntu-nginx-phpdev`
  - inherited in `network-lead`

### Fixes

* Allow Nginx images to include site configs

## 2.0.0

Released Monday 23rd Jan 2017.

### Refactor

- Change our container volumes to be more flexible
  - `/config` for loading in config files
  - `/data` for writing app data to
  - `/logs` for writing container logs to
  - `/workspace` for injecting the app for dev work

### New

- Image manipulation support for PHP
  - added GD extension to `ubuntu-nginx-phpdev`
  - added Imagick extension to `ubuntu-nginx-phpdev`

### Fixes

- Top-level `Makefile` now builds all images
  - added `ubuntu-nginx`
  - added `network-lead`
- `make XXX` now tells you which image or container it is working with
- Image startup script now tells you if there are no scripts
- `ubuntu-nginx-phpdev` now writes more to the mount points
  - `/logs` now contains the PHP-FPM process log (not just the PHP interpreter log)
  - `/data/php-sessions` now contains any PHP sessions

### Fixes

- Jenkins CI
  - run `make build publish` as single step

## 1.0.3

Released Fri 20th Jan 2017.

### Fixes

- More fixes for problems with building on Jenkins.

## 1.0.2

Released Fri 20th Jan 2017.

### Fixes

- Fixes for problems with building on Jenkins.

## 1.0.1

Released Fri 20th Jan 2017.

### Fixes

- Fixes for problems with building on Jenkins.

## 1.0.0

Released Fri 20th Jan 2017.

### New

Initial release