define runit::service($source_file) {
  include runit 

  $sv_dir = "/etc/sv/$name"
  $service_dir = "/etc/service/$name"
  notice("RUNIT NAME: '$name'")
  
  file { "$sv_dir":
    ensure => directory,
    require => File["/etc/sv", "/etc/service"],
  }

  file { "$sv_dir/run" :
    owner => root,
    group => root,
    mode => 755,
    ensure => present,
    source => $source_file,
    require => File[$sv_dir],
  }

  file { $service_dir:
    ensure => link,
    target => $sv_dir,
    require => File[$sv_dir],
  }
}
