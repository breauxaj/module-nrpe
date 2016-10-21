define nrpe::config (
  $allowed_hosts = [''],
) {
  include ::nrpe

  file { $::nrpe::params::nrpe_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nrpe/nrpe.erb'),
    notify  => Service[$::nrpe::params::nrpe_service],
    require => Package[$::nrpe::params::nrpe_package]
  }

}
