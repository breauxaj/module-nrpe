nrpe
====

NRPE allows you to remotely execute Nagios plugins on other Linux/Unix machines.

Samples
-------
```
include nrpe
```
```
nrpe::config { 'default': allowed_hosts => [ '192.168.1.1'] }
```
```
nrpe::check { 'disks':
  ensure  => present,
  command => '/usr/lib64/nagios/plugins/check_disk -w 15% -c 10%'
}
```

Hiera
-----

Review the hiera folder for samples of the usage.

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com