class minecraft{
  package {'java-11-openjdk-devel':
    insure => installed,
}

  file {'/opt/minecraft':
    ensure => directory,
}

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar',
}

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/files/minecraft.service',
}

  service {'minecraft.service':
        ensure => running,
}
}
