ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/locale.conf")
    file.insert_line_if_no_match("LC_CTYPE=\"en_US.UTF-8\"", "LC_CTYPE=\"en_US.UTF-8\"")
    file.write_file
  end
end

include_recipe 'yum-epel'

packages = ['telnet', 'vim', 'yum-utils', 'net-tools', 'htop']

packages.each do |p|
  package p
end
