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
  package {'nginx':
    ensure => installed,
}

nginx { 'static':
  listen_port => 80,
  proxy => 'http://192.168.33.11:80',
}

nginx { 'dynamic':
  listen_port => 81,
  proxy => 'http://192.168.33.12:80',
}

  service {'nginx':
    ensure => running,
} 
}
