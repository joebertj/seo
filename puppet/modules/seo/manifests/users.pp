class add_user {

  user { 'monitor':
    ensure => 'present',
    home => '/home/monitor',
    shell => '/bin/bash'
  }

}
