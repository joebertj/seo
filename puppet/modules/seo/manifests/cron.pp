class add_cron {

  file { '/home/monitor/script':
     ensure => 'directory',
  }

  exec { 'download_file':
     command => wget https://raw.githubusercontent.com/mojacka/seo/master/memory_check',
     cwd => '/home/monitor/script',
     creates => '/home/monitor/script/memory_check',
     require => Package['wget'],
     require => File['/home/monitor/script'],
  }
  
  file { '/home/monitor/src':
     ensure => 'directory',
  }

  exec { 'link_file':
     command => 'ln -s /home/monitor/script/memory_check /home/monitor/src/my_memory_check:
     creates => '/home/monitor/src/my_memory_check',
     require => [ Exec['download_file'], File['/home/monitor/script/memory_check'], File['/home/monitor/src' ],
  } 

  cron { '/home/monitor/src/my_memory_check':
     minute => '*/10',
     require => [ File['/home/monitor/src/my_memory_check'], Exec['link_file'] ],
  }

}
