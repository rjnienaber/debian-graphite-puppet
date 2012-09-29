node 'statsd-graphite', 'statsd-graphite.fxcapital.local' {
  include ssh, graphite, runit, statsd, gunicorn, nginx
  #sudo, apt, postfix, mysql, apache,
  
  package { ["vim", "lynx"]:
    ensure => present,
  }

  file { "/opt/deploy":
    owner => "root",
    group => "root",
    mode => 0644,
    ensure => directory,
  }

  nginx::resource::upstream { 'unicorn-upstream':
    ensure  => present,
    members => ['localhost:3000'],
    require => Class["statsd", "graphite", "gunicorn", "runit"],
  }

  nginx::resource::vhost { '172.16.24.135':
    ensure => present,
    proxy  => 'http://unicorn-upstream',
    require => Class["statsd", "graphite", "gunicorn", "runit"],
  }
}


