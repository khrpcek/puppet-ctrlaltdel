# == Class: ctrlaltdel
#
# Full description of class ctrlaltdel here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ctrlaltdel':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class ctrlaltdel {
  case $::operatingsystemmajrelease {
    5: {
    file_line { ctrlaltdel:
      path => '/etc/inittab',
      line => '#ca::ctrlaltdel:/sbin/shutdown -t3 -r now',
      match => '^*ctrlaltdel*',
    }
  }
    6: {
    file_line { ctrlaltdel:
      path => '/etc/inittab',
      line => '#ca::ctrlaltdel:/sbin/shutdown -t3 -r now',
      match => '^.*ctrlaltdel.*',
    }
  }
    7: {
    file { '/etc/systemd/system/ctrl-alt-del.target':
      ensure => 'link',
      target => '/dev/null',
    }
  }
  }
}
