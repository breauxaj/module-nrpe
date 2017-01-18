# Class: nrpe::plugins
#
# This class installs Nagios Plugins
#
# Parameters:
#
# Actions:
#   - Installs the nagios plugins
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nrpe::plugins': }
#
class nrpe::plugins (
  $ensure = $::nrpe::params::nrpe_package_ensure
) inherits ::nrpe::params {
  case $::osfamily {
    'Debian': {

    }
    'RedHat': {
      package { $::nrpe::params::nrpe_plugins_packages:
        ensure  => $ensure,
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
