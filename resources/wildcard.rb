actions :create
default_action :create

attribute :domain, :kind_of => String, :name_attribute => true
attribute :ttl, :kind_of => Integer, :default => 86400
attribute :email, :kind_of => String, :required => true
attribute :type,  :kind_of => String, :default => "master"

attribute :refresh, :kind_of => Integer, :default => 3600
attribute :retry, :kind_of => Integer, :default => 900
attribute :expire, :kind_of => Integer, :default => 604800
attribute :negative_ttl, :kind_of => Integer, :default => 3600
attribute :nameserver, :kind_of => Array, :default => Array.new
attribute :ipaddress, :kind_of => String, :required => true
