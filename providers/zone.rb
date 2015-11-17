hosts = Hash.new()

action :create do
    template "#{node['bind']['zonedir']}db.#{new_resource.domain}" do
      source "zone.erb"
      cookbook "bind"
      owner node['bind']['user']
      group node['bind']['group']
      mode 0600
      variables(
        :new_resource => new_resource,
        :hosts => hosts
      )
      notifies :restart, resources(:service => node['bind']['service_name'])
    end
end
