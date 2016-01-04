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

packages = ['linux-image-extra-$(uname -r)', 'vim', 'telnet', 'htop', 'docker-engine']
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
