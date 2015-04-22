# Install OpenSwan and allow forwarding
package 'openswan' do
  action :install
end

ruby_block "forwarding" do
  block do
    file = Chef::Util::FileEdit.new("/etc/sysctl.conf")
    file.search_file_replace("net.ipv4.ip_forward = 0", "net.ipv4.ip_forward = 1")
    file.write_file
  end
end

Dir.foreach('/proc/sys/net/ipv4/conf') do |item|
  next if item == '.' or item == '..'
  execute("accept_redirects") do
    command "echo 0 > /proc/sys/net/ipv4/conf/#{item}/accept_redirects"
  end
  execute("send_redirects") do
    command "echo 0 > /proc/sys/net/ipv4/conf/#{item}/send_redirects"
  end
end

service "network" do
  action :restart
end

execute("verifying the status of SERVICES required by OpenSWAN") do
  command "sudo ipsec verify"
end
