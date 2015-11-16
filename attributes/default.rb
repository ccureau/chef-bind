case platform_family
when 'rhel'
  default['bind']['packages'] = %w{ bind bind-utils }
  default['bind']['service_name'] = "named"
  default['bind']['dir']   = "/etc/"
  default['bind']['user']  = "named"
  default['bind']['group'] = "named"
  default['bind']['rundir'] = "/var/named"
when 'debian'
  default['bind']['packages'] = %w{ bind9 dnsutils }
  default['bind']['service_name'] = "bind9"
  default['bind']['dir']   = "/etc/bind"
  default['bind']['user']  = "bind"
  default['bind']['group'] = "bind"
  default['bind']['rundir'] = "/var/cache/bind/"
end

default['bind']['statdir'] = "#{node['bind']['rundir']}data/"
default['bind']['keydir'] = "#{node['bind']['rundir']}dynamic/"
default['bind']['confdir'] = "#{node['bind']['dir']}#{node['bind']['service_name']}/"
default['bind']['zonedir'] = "#{node['bind']['confdir']}zones/"
default['bind']['logdir'] = "/var/log/#{node['bind']['service_name']}/"

# bind 9.8 and above support automatic empty zones to reduce bogus outgoing
# traffic.  We use this by default.  If this is not set to 'true', the older
# method of specifying empty zones as zone files is used.
default['bind']['emptyzones'] = true

# Should we enable dnssec?
default['bind']['dnssec'] = true

# default options that should be overridden
default['bind']['options'] = { }
default['bind']['zones'] = { }
