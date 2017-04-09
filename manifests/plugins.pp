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
  package { $::nrpe::params::nrpe_plugins_packages:
    ensure  => $ensure,
  }

  file { "${::nrpe::params::nrpe_plugins}/check_apachestatus.pl":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/nrpe/check_apachestatus.pl',
    require => Package[$::nrpe::params::nrpe_plugins_packages]
  }

  file { "${::nrpe::params::nrpe_plugins}/check_mem":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/nrpe/check_mem',
    require => Package[$::nrpe::params::nrpe_plugins_packages]
  }

  file { "${::nrpe::params::nrpe_plugins}/check_website_response.sh":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/nrpe/check_website_response.sh',
    require => Package[$::nrpe::params::nrpe_plugins_packages]
  }

}
