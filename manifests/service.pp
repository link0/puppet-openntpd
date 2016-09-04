# == Class: openntpd::service
#
class openntpd::service inherits openntpd {
  if $openntpd::service_manage {
    service { 'openntpd':
      name   => $openntpd::service_name,
      ensure => $openntpd::service_ensure,
    }
  }
}
