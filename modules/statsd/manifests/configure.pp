class statsd::configure {
  file { "/opt/deploy/statsd/prod.js":
    owner => root,
    group => root,
    mode => 644,
    ensure => present,
    source => "puppet:///modules/statsd/prod.js",
    require => Class["statsd::install"],
  }
}
