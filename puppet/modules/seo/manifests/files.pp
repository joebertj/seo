class add_files {

  file { '/home/monitor/script':
     ensure => 'directory',
  }

  exec { 'download_file':
     command => wget https://raw.githubusercontent.com/mojacka/seo/master/memory_check',
     cwd => '/home/monitor/script',
     require => Package['wget'],
     require => File['/home/monitor/script'],
  }
  
  file { '/home/monitor/src':
     ensure => 'directory',
  }

  exec { 'ln -s /home/monitor/script/memory_check /home/monitor/src/my_memory_check:
     require => Exec['download_file'],
     require => File['/home/monitor/script/memory_check'],
  } 

}
