action :create do
    template "db.#{node['bind']['zonedir']}#{[new_resource.domain]} do
      source "zone.erb"
      owner node['bind']['user']
      group node['bind']['group']
      mode 0600
      variables (
        :new_resource => new_resource
      )
      notifies :restart, resources(:service => node['bind']['service_name'])
    end
end
