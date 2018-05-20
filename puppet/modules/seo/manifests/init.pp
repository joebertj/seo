class seo {

  package { 'vim':
     ensure => 'installed',
  }
   
  package { 'curl':
     ensure => 'installed',
  }
   
  package { 'git':
     ensure => 'installed',
  }

  package { 'wget':
     ensure => 'installed',
  }
  
  user { 'monitor':
     ensure => 'present',
     home => '/home/monitor',
     shell => '/bin/bash'
  }

  file { '/home/monitor':
     ensure => 'directory',
     owner => 'monitor',
     require => User['monitor'],
  }

  file { '/home/monitor/script':
     ensure => 'directory',
     owner => 'monitor',
     require => User['monitor'],
  }

  exec { 'download_file':
     command => 'wget https://raw.githubusercontent.com/mojacka/seo/master/memory_check',
     cwd => '/home/monitor/script',
     path => [ '/bin', '/usr/bin', '/usr/sbin' ],
     creates => '/home/monitor/script/memory_check',
     user => 'monitor',
     require => [ Package['wget'], File['/home/monitor/script'] ],
  }
  
  file { '/home/monitor/src':
     ensure => 'directory',
     owner => 'monitor',
     require => User['monitor'],
  }
 
  file { '/home/monitor/src/my_memory_check':
     ensure => 'link',
     target => '/home/monitor/script/memory_check',
     require => [ Exec['download_file'], File['/home/monitor/script'], File['/home/monitor/src'] ],
  } 

  cron { 'mmc':
     command => '/home/monitor/src/my_memory_check -w 80 -c 90 -e joebertj@gmail.com',
     ensure => 'present',
     minute => '*/10',
     user => 'monitor',
     require => File['/home/monitor/src/my_memory_check'],
  }

  file { '/usr/share/zoneinfo/Asia/Manila':
     ensure => 'link',
     target => '/etc/localtime',
  }

  exec { 'hostname bpx.server.local':
     path => [ '/bin', '/usr/bin', '/usr/sbin' ],
  }
 
  exec { 'sed -i "s/^HOSTNAME=.*$/HOSTNAME=bpx.server.local/" /etc/sysconfig/network':
     path => [ '/bin', '/usr/bin', '/usr/sbin' ],
  }
  
  exec { 'sed -i "s/127.0.0.1\s.*$/127.0.0.1\tbpx.server.local/" /etc/hosts':
     path => [ '/bin', '/usr/bin', '/usr/sbin' ],
  }
 
}
