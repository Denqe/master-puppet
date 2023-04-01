class minecraft{
  package {'java-11-openjdk-devel':
    insure => installed,
}

  file {'/opt/minecraft':
    ensure => directory,
}

  file {'/etc/systemd/system/minecraft.service':
    source => 'puppet:///modules/minecraft/files/minecraft.service',
}

  service {'minecraft.service':
        ensure => running,
}


}
