node slave2.puppet{
  file { '/root/README':
    ensure => file,
    content => 'Hello, denqq',
  }
}
