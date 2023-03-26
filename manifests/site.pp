node master.puppet{
  package { 'git':
    ensure => installed,
  }
  service { 'firewalld':
    ensure => stopped,
  }
  



}
