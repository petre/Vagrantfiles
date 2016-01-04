#ruby_block "insert_line" do
#  block do
#    file = Chef::Util::FileEdit.new("/etc/locale.conf")
#    file.insert_line_if_no_match("LC_CTYPE=\"en_US.UTF-8\"", "LC_CTYPE=\"en_US.UTF-8\"")
#    file.write_file
#  end
#end

cookbook_file "/etc/apt/sources.list.d/docker.list" do
  source "docker.list"
    mode 0644
    owner "root"
    group "root"
end

apt_repository 'docker' do
  uri        'https://apt.dockerproject.org/repo'
  components ['ubuntu-vivid', 'main']
  keyserver 'hkp://p80.pool.sks-keyservers.net:80'
  key '58118E89F3A912897C070ADBF76221572C52609D'
end

#packages = ['telnet', 'htop', 'vim', 'yum-utils', 'net-tools', 'docker-engine' ]
packages = ['linux-image-extra-$(uname -r)', 'vim', 'htop', 'docker-engine']
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
