define nrpe::config (
  $value
) {
  include ::nrpe

  $key = $title

  case $::operatingsystem {
    'Amazon': {
      file { '/usr/share/augeas/lenses/dist/nrpe.aug':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/nrpe/nrpe.aug',
        before => Augeas["nrpe_cfg/${key}"]
      }
    }
    default: { }
  }

  augeas { "nrpe_cfg/${key}":
    context => $::nrpe::params::nrpe_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::nrpe::params::nrpe_service],
    require => Package[$::nrpe::params::nrpe_package],
  }

}
