node default {
  include ::nrpe

  case $::osfamily {
    'Debian': {

    }
    'RedHat': {
      nrpe::check { 'httpd': command => '/usr/lib64/nagios/plugins/check_procs -w 5:10 -c 5:20 -C httpd' }
      nrpe::config { allowed_hosts: value => '127.0.0.1 172.16.1.1' }
    }
    default: { }
  }
}
