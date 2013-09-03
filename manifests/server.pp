class zabbix::server (
    $pkg_ensure     = 'present',
    $config_file    = $zabbix::params::server_config,
    $pid_file       = $zabbix::params::server_pid,
    $log_file       = $zabbix::params::server_log,
    $db_type        = $zabbix::params::server_db_type,
    $db_config_file = $zabbix::params::server_db_config,
    $db_host        = 'localhost',
    $db_name        = 'zabbix',
    $db_username    = 'zabbix',
    $db_password    = 'zabbix',
    $db_port        = '0',
    $use_zabbix_v2  = $zabbix::params::use_v2
  ) inherits zabbix::params {

  case $db_type {
    'mysql', 'pgsql': { $pkg_name = "${zabbix::params::server_pkg_stub}-{$db_type}" }
    default:          { fail("Database type not supported") }
  }

  if ::osfamily == 'Redhat' {
    $web_pkg_name = "${zabbix::params::server_web_pkg_stub}-{$db_type}"
  }
  else {
    $web_pkg_name = $zabbix::params::server_web_pkg_stub
  }
  
  package { $pkg_name:
    ensure => $pkg_ensure,
  }

  package { $frontend_pkg_name:
    ensure => $pkg_ensure,
  }

  service { $zabbix::params::server_service:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File[$config_file],
  }

  File {
    owner => root,
    owner => root,
    mode  => 0640,
  }

  file { $config_file:
    ensure => present,
    content => template("$module_name/server_config.erb"),
    require => Package[$pkg_name],
  }

  file { $config_file:
    ensure => present,
    content => template("$module_name/server_web_db_config.erb"),
    require => Package[$frontend_pkg_name],
  }
}
