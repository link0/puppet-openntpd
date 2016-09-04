# == Class: openntpd::config
#
class openntpd::config inherits openntpd {
  if $openntpd::config_manage {
    file { 'ntpd.conf':
      ensure  => file,
      name    => $openntpd::config_file,
      content => template($openntpd::config_template),
    }
  }
}
