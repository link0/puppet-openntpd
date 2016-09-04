# link0/puppet-openntpd

## Overview

The [link0/openntpd](https://forge.puppet.com/link0/openntpd) module installs, configures and manages the OpenNTPD service.

## Usage

### 

Basic usage accepting all defaults (installation, configuration, managing the service, etcetera)

```puppet
include '::openntp'
``` 

Although, if you would like to have more control over the service, you can pass parameters like this:

```puppet
class { '::openntp':
  servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
}
```

## Hieradata

This module is completely configurable using Hieradata. An example of this:
```yaml
openntpd::listen: '127.0.0.1'
openntpd::servers:
  - '0.europe.pool.ntp.org'
  - '1.europe.pool.ntp.org'
```

## Customization

### `package_manage`
Whether the package should be managed by puppet. Type: `boolean`. Defaults to `true`
eg `package_manage: false` will not install the package from your package manager

### `package_ensure`
If the package is managed, how to ensure the package, Type: `installed`, `absent` or `latest`. Defaults to `installed`

### `package_name`
If the package is available under a different name, you can specify it here. Type: `string` Defaults to `openntpd`

### `service_manage`
Whether you want puppet to manage the service. Type: `boolean`, defaults to `true`

### `service_ensure`
If the service is managed by puppet, what should be ensured. Type: `running` or `stopped`. Defaults to `running`

### `service_name`
If the service is managed by puppet, what the name of the service should be. Type: `string` Defaults to 'openntpd'.

### `config_manage`
Whether this module should manage the configuration files. Type: `bool`. Defaults to `true`

### `config_file`
If the configuration is managed by puppet, which location the configuration file should be at. Type: `absolute path`

### `config_template`
The template file for the configuration file. Can be overridden for custom behaviour. Type: `string` Defaults to `openntpd/openntpd.conf.erb`.

### `servers`
An array of servers to connect to. Type: `array` Defaults to a generic pool list.

### `listen`
A value to let the daemon listen on. Type: `string` or `false`. Defaults to `false`.
Example: `127.0.0.1`.

