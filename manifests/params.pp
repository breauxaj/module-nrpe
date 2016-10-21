# Class: nrpe::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class nrpe::params {
  $nrpe_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      $nrpe_confd   = '/etc/nrpe.d'
      $nrpe_config  = '/etc/nagios/nrpe.cfg'

      $nrpe_package = 'nrpe'
      $nrpe_service = 'nrpe'

      $nrpe_plugins = '/usr/lib64/nagios/plugins'

      $nrpe_plugins_packages = [
        'nagios-plugins-all',
        'nagios-plugins-check-updates',
        'nagios-plugins-nrpe'
      ]

      $nrpe_user  = 'nrpe'
      $nrpe_group = 'nrpe'

      $pid_file    = '/var/run/nrpe/nrpe.pid'
      $include_dir = '/etc/nrpe.d/'

      file { '/etc/firewalld/services/nrpe.xml':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0640',
        source => 'puppet:///modules/nrpe/nrpe.xml',
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
