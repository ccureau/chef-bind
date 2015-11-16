#
# Cookbook Name:: bind
# Recipe:: default
#
# Copyright 2015 Chris Cureau
#
# All rights reserved - Do Not Redistribute
#

# Install bind and bind-utils
node['bind']['packages'].each do |pkg|
  package pkg
end

# service declaration
service node['bind']['service_name'] do
  supports :start => true, :status => true, :reload => true, :restart => true
  action [ :enable, :start ]
end

# Generate rndc.key if it doesn't exist
execute 'generate_rndc_key' do
  command 'rndc-confgen -a -r /dev/urandom'
  not_if { File.exists?('/etc/rndc.key') }
end

# Create directory structure, verify permissions
directory node['bind']['rundir'] do
  owner node['bind']['user']
  group node['bind']['group']
end

directory node['bind']['statdir'] do
  owner node['bind']['user']
  group node['bind']['group']
end

directory node['bind']['confdir'] do
  owner 'root'
  group node['bind']['group']
end

directory node['bind']['zonedir'] do
  owner node['bind']['user']
  group node['bind']['group']
end

directory node['bind']['logdir'] do
  owner node['bind']['user']
  group node['bind']['group']
end

directory node['bind']['keydir'] do
  owner node['bind']['user']
  group node['bind']['group']
end

# Write out configuration files
template "#{node['bind']['dir']}named.conf" do
  owner 'root'
  group node['bind']['group']
  mode '0640'
  notifies :reload, "service[#{node['bind']['service_name']}]", :delayed
end

template "#{node['bind']['confdir']}named.conf.options" do
  owner node['bind']['user']
  group node['bind']['group']
  mode '0660'
  notifies :reload, "service[#{node['bind']['service_name']}]", :delayed
end

template "#{node['bind']['confdir']}named.conf.log" do
  owner node['bind']['user']
  group node['bind']['group']
  mode '0660'
  notifies :reload, "service[#{node['bind']['service_name']}]", :delayed
end
