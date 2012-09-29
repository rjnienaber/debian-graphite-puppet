class statsd::install {
  $temp_location = "/tmp/nodejs_0.8.9_amd64.deb"
  file { $temp_location:
    owner => root,
    group => root,
    mode => 644,
    ensure => present,
    source => "puppet:///modules/statsd/nodejs_0.8.9_amd64.deb",
  }

  package { "nodejs":
    provider => dpkg,
    ensure => latest,
    source => $temp_location,
  }

  package { ["git-core"]:
    ensure => present,
  }

  exec { "clone statsd repo":
    command => "git clone https://github.com/etsy/statsd.git",
    cwd => "/opt/deploy",
    creates => "/opt/deploy/statsd",
    path => "/usr/bin",
    require => [Package["git-core"], File["/opt/deploy"]],
  } 
}
