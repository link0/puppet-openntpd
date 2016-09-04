# == Class: openntpd
#
class openntpd (

  $package_manage  = $openntpd::params::package_manage,
  $package_ensure  = $openntpd::params::package_ensure,
  $package_name    = $openntpd::params::package_name,

  $service_manage  = $openntpd::params::service_manage,
  $service_ensure  = $openntpd::params::service_ensure,
  $service_name    = $openntpd::params::service_name,

  $config_manage   = $openntpd::params::config_manage,
  $config_file     = $openntpd::params::config_file,
  $config_template = $openntpd::params::config_template,

  $servers         = $openntpd::params::servers,
  $listen          = $openntpd::params::listen,

) inherits openntpd::params {

  validate_bool($package_manage)
  validate_re($package_ensure, '^installed|latest|absent$')
  validate_string($package_name)

  validate_bool($service_manage)
  validate_re($service_ensure, '^running|stopped$')
  validate_string($service_name)

  validate_bool($config_manage)
  validate_absolute_path($config_file)
  validate_string($config_template)

  validate_array($servers)

  if $listen {
    validate_string($listen)
  }

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'openntpd::begin': } ->
  class { '::openntpd::install': } ->
  class { '::openntpd::config': } ~>
  class { '::openntpd::service': } ->
  anchor { 'openntpd::end': }

}
