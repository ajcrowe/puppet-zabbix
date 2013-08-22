class zabbix::agent (
    $server_host  = 'localhost',
    $server_port  = '10051',
    $pidfile      = '/var/run/zabbix-agent/zabbix_agentd.pid',
    $logfile      = '/var/log/zabbix-agent/zabbix_agentd.log',
    $num_agents   = '5',
    $debug_level  = '3',
    $agent_listen = false,
    $agent_listen_port = '10050',
    $agent_listen_host = 'localhost',
    $remote_cmd   = false,
  ) {

  
}