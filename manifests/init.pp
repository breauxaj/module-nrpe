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

  package { $::nrpe::params::nrpe_package:
    ensure  => $ensure,
  }

  $checks = hiera_hash('nrpe::checks',{})
  create_resources('nrpe::check',$checks)

  $config = hiera_hash('nrpe::config',{})
  create_resources('nrpe::config',$config)

  service { $::nrpe::params::nrpe_service:
    ensure  => running,
    enable  => true,
    require => Package[$::nrpe::params::nrpe_package]
  }

}
