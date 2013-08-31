class zabbix::agent (
    $server_host  = 'localhost',
    $server_port  = '10051',
    $pidfile      = '/var/run/zabbix-agent/zabbix_agentd.pid',
    $logfile      = '/var/log/zabbix-agent/zabbix_agentd.log',
    $num_agents   = '5',
    $debug_level  = '3',
    $agent_listen = true,
    $listen_port = '10050',
    $listen_host = '0.0.0.0',
    $remote_cmd   = false,
  ) {

  
}