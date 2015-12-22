ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/locale.conf")
    file.insert_line_if_no_match("LC_CTYPE=\"en_US.UTF-8\"", "LC_CTYPE=\"en_US.UTF-8\"")
    file.write_file
  end
end

cookbook_file "/etc/yum.repos.d/docker.repo" do
  source "docker.repo"
    mode 0644
    owner "root"
    group "root"
end

packages = ['telnet', 'htop', 'vim', 'yum-utils', 'net-tools', 'docker-engine' ]

packages.each do |p|
  package p
end

service 'docker' do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

group 'docker' do
  members ['vagrant']
end
