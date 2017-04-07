define nrpe::config (
  $value
) {
  include ::nrpe

  $key = $title

  augeas { "nrpe_cfg/${key}":
    context => $::nrpe::params::nrpe_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::nrpe::params::nrpe_service],
    require => Package[$::nrpe::params::nrpe_package],
  }

}
