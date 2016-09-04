class openntpd::config inherits openntpd {
  if $openntpd::config_manage {
    file { 'ntpd.conf':
      name    => $openntpd::config_file,
      ensure  => file,
      content => template($openntpd::config_template),
    }
  }
}
