cookbook_file "/etc/environment" do
  source "environment"
    mode 0644
    owner "root"
    group "root"
end

include_recipe 'yum-epel'

packages = ['telnet', 'htop', 'vim', 'yum-utils', 'net-tools', 'openvpn']

packages.each do |p|
  package p
end

include_recipe 'squid'
include_recipe 'openvpn::client'
