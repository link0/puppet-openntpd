# == Class: openntpd::install
#
class openntpd::install inherits openntpd {
  if $openntpd::package_manage {
    package { 'openntpd':
      ensure => $openntpd::package_ensure,
      name   => $openntpd::package_name,
    }
  }
}
