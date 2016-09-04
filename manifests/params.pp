# == Class: openntpd::params
#
class openntpd::params {

  $package_manage = true
  $package_ensure = installed
  $package_name = 'openntpd'

  $service_manage = true
  $service_ensure = running
  $service_name = 'openntpd'

  $config_manage = true
  $config_file = '/etc/openntpd/ntpd.conf'
  $config_template = 'openntpd/ntpd.conf.erb'

  $servers = [
    '0.pool.ntp.org',
    '1.pool.ntp.org',
    '2.pool.ntp.org',
    '3.pool.ntp.org',
  ]

  $listen = false

}
