class runit {
  package { "runit":
    ensure => present,
  }

  file { ["/etc/sv", "/etc/service"]:
    ensure => directory,
    require => Package["runit"],
  }
}
