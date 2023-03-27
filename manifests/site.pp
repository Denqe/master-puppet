node 'slave1.puppet'{
  package {'httpd':
    ensure => installed,
 }
  
 #  file { '/var/www/html':
  #  ensure => directory
 #}
  
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
  
 # file { '/var/www/html':
  #  ensure => directory,
# }
  
  file { '/var/www/html/index.php':
    ensure => file,
    source => 'vagrant/index.php'
 }
  
  service {'httpd':
    ensure => running,
}  
}
