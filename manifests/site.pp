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

  file {'/etc/nginx/conf.d/stat.conf':
    ensure => file,
    source => '/vagrant/stat.conf'
}

  file {'/etc/nginx/conf.d/dyn.conf':
    ensure => file,
    source => '/vagrant/dyn.conf'
}

  exec {'selinux':
    command     => 'setenforce Permissive',
    path        => ['/bin'],
    user       => 'root',
}

  exec {'restart_nginx':
    command     => 'systemctl restart nginx',
    path        => ['/bin'],
    user => 'root',
}
} 
}
