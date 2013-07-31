class activemq {
    include homebrew
    include activemq::config
    
    file { [
      $activemq::config::configdir,
      $activemq::config::datadir,
      $activemq::config::logdir
    ]:
    ensure => directory
  }

  #file { "${boxen::config::homebrewdir}/etc/activmeq.xml":
  #  ensure  => absent,
  #  require => Package['boxen/brews/activemq']
  #}

  homebrew::formula { 'activemq':
    before => Package['boxen/brews/activemq'],
  }

  package { 'boxen/brews/activemq':
    ensure => '5.8.0-boxen1',
    notify => Service['dev.activemq'],
  }

  file { '/Library/LaunchDaemons/dev.activemq.plist':
    content => template('activemq/dev.activemq.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.activemq'],
    owner   => 'root'
  }

  service { 'dev.activemq':
    ensure  => running
  } 
}
