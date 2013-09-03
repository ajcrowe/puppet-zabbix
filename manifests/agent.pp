class zabbix::agent (
    $pkg_ensure   = 'present',
    $server_host  = 'localhost',
    $server_port  = '10051',
    $num_agents   = '5',
    $debug_level  = '3',
    $agent_listen = true,
    $listen_port  = '10050',
    $listen_host  = '0.0.0.0',
    $remote_cmd   = false,
    $config_file  = $zabbix::params::agent_conf,
    $pid_file     = $zabbix::params::agent_pid,
    $log_file     = $zabbix::params::agent_log,
  ) inherits zabbix::params {

  package { $zabbix::params::agent_pkg:
    ensure => $pkg_ensure,
  }

  service { $zabbix::params::agent_service:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File[$config_file],
  }

  file { $config_file:
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0640,
    content => template("$module_name/$config_file.erb"),
    require => Package[$zabbix::params::agent_pkg],
  }

}