# puppet-zabbix

Puppet module to manage server and agent installs of the [Zabbix](http://www.zabbix.com) monitoring tool.

## Use Cases

### Simple agent install

```ruby
	class 'zabbix::agent' {
		server_host => 'zabbix.mydomain.com'
	}
```

### Advanced agent install

```ruby
	class 'zabbix::agent' {
		server_host   => 'zabbix.mydomain.com',
		num_agent     => 10,
		remote_cmd    => true,
		custom_params => [ "my_cmd1", "my_cmd2", "my_cmd3", ],
	}
```
