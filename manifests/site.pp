node 'slave1.puppet'{
  package {'httpd':
    ensure => installed,
}
  
  service {'firewalld':
    ensure => stopped,
}
  
  file { '/var/www/html/index.html':
    ensure => file,
    source => '/vagrant/index.html'
}
   
  service {'httpd':
    ensure => running,
}
}

node 'slave2.puppet'{
  package {'httpd':
    ensure => installed,
}
  
  package {'php':
    ensure => installed,
}
  
  service {'firewalld':
    ensure => stopped,
} 
  file {'/var/www/html/index.php':
    ensure => file,
    source => '/vagrant/index.php'
}
  
  service {'httpd':
    ensure => running,
}  
}

node 'master.puppet'{
  class { 'nginx':
  nginx::resource::server { 'stat':
    listen_port => 81,
    proxy       => 'http://192.168.50.11:80',
}

  nginx::resource::server { 'dyn':
    listen_port => 8080,
    proxy       => 'http://192.168.50.12:80',
}
}
  exec {'selinux':
    command     => 'setenforce 0',
    path        => ['/usr/bin', '/bin', '/usr/sbin'],
    user       => 'root',
}

  exec {'restart_nginx':
    command     => 'systemctl restart nginx',
    path        => ['/bin'],
    user => 'root',
} 
}
