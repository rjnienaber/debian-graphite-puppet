class gunicorn::install {
  $temp_location = "/tmp/python-gunicorn_0.14.6_all.deb"
  file { $temp_location:
    owner => root,
    group => root,
    mode => 644,
    ensure => present,
    source => "puppet:///modules/gunicorn/python-gunicorn_0.14.6_all.deb",
  }

  package { "python-gunicorn":
    provider => dpkg,
    ensure => latest,
    source => $temp_location,
  }
}
