# CHANGELOG

## develop

### Refactor

- Change our container volumes to be more flexible
  - `/config` for loading in config files
  - `/data` for writing app data to
  - `/logs` for writing container logs to
  - `/workspace` for injecting the app for dev work

### New

- `make XXX` now tells you which image or container it is working with

### Fixes

- Top-level `Makefile` now builds all images
  - added `ubuntu-nginx`
  - added `network-lead`

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