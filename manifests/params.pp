class zabbix::params {
  case $::osfamily {
    'Debian': {
      $agent_pkg           = 'zabbix-agent'
      $agent_service       = 'zabbix-agent'
      $agent_config        = '/etc/zabbix/zabbix_agentd.conf'
      $agent_pid           = '/var/run/zabbix-agent/zabbix_agentd.pid'
      $agent_log           = '/var/log/zabbix-agent/zabbix_agentd.log'
      $server_pkg_stub     = 'zabbix-server'
      $server_web_pkg_stub = 'zabbix-frontend-php'
      $server_service      = 'zabbix-server'
      $server_config       = '/etc/zabbix/zabbix_server.conf'
      $server_db_config    = '/etc/zabbix/zabbix.conf.php'
      $server_pid          = '/var/run/zabbix/zabbix_server.pid'
      $server_log          = '/var/log/zabbix-server/zabbix_server.log'
      $server_db_type      = 'mysql'
    }
    'RedHat': {
      $common_pkg          = 'zabbix'
      $agent_service       = 'zabbix-agent'
      $agent_config        = '/etc/zabbix/zabbix_agentd.conf'
      $agent_pid           = '/var/run/zabbix/zabbix_agentd.pid'
      $agent_log           = '/var/log/zabbix/zabbix_agentd.log'
      $server_service      = 'zabbix-server'
      $server_config       = '/etc/zabbix/zabbix_server.conf'
      $server_db_config    = '/etc/zabbix/zabbix.conf.php'
      $server_pid          = '/var/run/zabbix/zabbix_server.pid'
      $server_log          = '/var/log/zabbix-server/zabbix_server.log'
      $server_db_type      = 'mysql'
      $agent_pkg           = 'zabbix-agent'
      $server_pkg_stub     = 'zabbix-server'
      $server_web_pkg_stub = 'zabbix-web'
      $common_pkg          = 'zabbix'
      $agent_v2_pkg           = 'zabbix20-agent'
      $server_v2_pkg_stub     = 'zabbix20-server'
      $server_web_v2_pkg_stub = 'zabbix20-web'
      $common_v2_pkg          = 'zabbix20'
    }
    default: {
      fail("OS not supported: ${::osfamily}")
    }
  }
}