class statsd::service {
  runit::service { "statsd":
    source_file => "puppet:///modules/statsd/runit-run",
  }
}
