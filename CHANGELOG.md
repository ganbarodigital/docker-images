# CHANGELOG

## develop

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

Released Fri 21st Jan 2017.

### Fixes

- More fixes for problems with building on Jenkins.

## 1.0.2

Released Fri 21st Jan 2017.

### Fixes

- Fixes for problems with building on Jenkins.

## 1.0.1

Released Fri 21st Jan 2017.

### Fixes

- Fixes for problems with building on Jenkins.

## 1.0.0

Released Fri 21st Jan 2017.

### New

Initial release