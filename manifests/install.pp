# == Class: openntpd::install
#
class openntpd::install inherits openntpd {
  if $openntpd::package_manage {
    package { 'openntpd':
      name   => $openntpd::package_name,
      ensure => $openntpd::package_ensure,
    }
  }
}
