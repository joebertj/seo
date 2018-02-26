class install_packages {

   package { 'vim':
     ensure => 'installed',
     before => Package['curl'],
   }
   package { 'curl':
     ensure => 'installed',
     before => Package['git'],
   }
   package { 'git':
     ensure => 'installed',
   }
}
