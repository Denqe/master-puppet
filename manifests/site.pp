node master.puppet{
  package { 'git':
    ensure => installed,
  }
  package { 'r10k':
    ensure => installed,
  }
  service { 'firewalld':
    ensure => stoped,
  }
  



}
