#
# Cookbook Name:: bind
# Recipe:: test_bind_domain
#
# Copyright 2015 Chris Cureau
#
# All rights reserved - Do Not Redistribute
#

include 'bind::default'

bind_zone "cureau.net" do
  admin_email "root.localhost"
  nameserver "ns1.cureau.net"
  type "master"
  cidr "10.5.0.0/24"
end
