class zabbix::agent (
    $pkg_ensure    = 'present',
    $server_host   = 'localhost',
    $server_port   = '10051',
    $num_agents    = '5',
    $debug_level   = '3',
    $agent_listen  = true,
    $listen_port   = '10050',
    $listen_host   = '0.0.0.0',
    $remote_cmd    = false,
    $custom_params = undef,
    $config_file   = $zabbix::params::agent_config,
    $pid_file      = $zabbix::params::agent_pid,
    $log_file      = $zabbix::params::agent_log,
    $use_v2        = undef
  ) inherits zabbix::params {

  if $::osfamily == 'RedHat' and $use_v2 == true {
    $pkg_name = $zabbix::params::agent_v2_pkg
  }
  else {
    $pkg_name = $zabbix::params::agent_pkg
  }

  package { $pkg_name:
    ensure => $pkg_ensure,
  }

  service { $zabbix::params::agent_service:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File["$config_file"],
  }

  file { $config_file:
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0640,
    content => template("$module_name/agent_config.erb"),
    require => Package["$pkg_name"],
  }
}