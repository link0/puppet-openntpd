# == Class: openntpd::service
#
class openntpd::service inherits openntpd {
  if $openntpd::service_manage {
    service { 'openntpd':
      ensure => $openntpd::service_ensure,
      name   => $openntpd::service_name,
    }
  }
}
