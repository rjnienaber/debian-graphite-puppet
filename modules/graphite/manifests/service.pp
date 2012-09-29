class graphite::service {
  runit::service { "graphite":
    source_file => "puppet:///modules/graphite/runit-run",
  }
}
