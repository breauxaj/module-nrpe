node default {
  include ::nrpe

  case $::osfamily {
    'Debian': {

    }
    'RedHat': {

    }
    default: { }
  }
}
