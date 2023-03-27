node 'slave1.puppet'{
class html {
  package {'httpd':
    ensure => installed,
 }
  
  file { '/var/www/html':
    ensure => directory
 }
  
  file { '/var/www/html/index.html':
    ensure => file,
    source => 'puppet:///modules/html/index.html'
 }
   
  service {'httpd':
    ensure => running,
 }
 }
 }

node 'slave2.puppet'{
class php {
  package {'httpd', 'php':
    ensure => installed,
 }
  
  file { '/var/www/html':
    ensure => directory,
 }
  
  file { '/var/www/html/index.php':
    ensure => file,
    source => 'puppet:///modules/php/index.php'
 }
  
  service {'httpd':
    ensure => running,
}
}  
}
