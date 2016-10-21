define nrpe::check (
  $ensure = 'present',
  $command,
){
  file { "${::nrpe::params::nrpe_confd}/${name}.cfg":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nrpe/check.erb'),
    notify  => Service[$::nrpe::params::nrpe_service],
    require => Package[$::nrpe::params::nrpe_package]
  }

}