class add_zone {

   zone { bpx':
      sysidcfg => template('seo/sysidcfg.erb'),
      realhostname => 'bpx.server.local',
   }

}
