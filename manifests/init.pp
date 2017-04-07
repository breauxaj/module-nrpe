# Class: nrpe
#
# This class installs NRPE
#
# Parameters:
#
# Actions:
#   - Installs the nrpe package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nrpe': }
#
class nrpe (
  $ensure = $::nrpe::params::nrpe_package_ensure
) inherits ::nrpe::params {
  include nrpe::plugins

  case $::osfamily {
    'Debian': {

    }
    'RedHat': {
      package { $::nrpe::params::nrpe_package:
        ensure  => $ensure,
      }

      $config = hiera_array('nrpe::config',{})
      create_resources('nrpe::config',$config)

      $checks = hiera_hash('nrpe::checks',{})
      create_resources('nrpe::check',$checks)

      service { $::nrpe::params::nrpe_service:
        ensure  => running,
        enable  => true,
        require => Package[$::nrpe::params::nrpe_package]
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
