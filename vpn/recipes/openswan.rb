# Install OpenSwan and allow forwarding
package 'opensawn' do
  action :install
end

ruby_block "forwarding" do
  block do
    file = Chef::Util::FileEdit.new("/etc/sysctl.conf")
    file.search_file_replace("net.ipv4.ip_forward = 0", "net.ipv4.ip_forward = 1")
    file.write_file
  end
end

ruby_block "disable_redirects" do
  block do
    Dir.foreach('/proc/sys/net/ipv4/conf') do |item|
      next if item == '.' or item == '..'
      file "send_redirects" do
        path '/proc/sys/net/ipv4/conf/#{item}/send_redirects'
        owner 'root'
        group 'root'
        mode '0755'
        content '0'
      end
      file "accept_redirects" do
        path '/proc/sys/net/ipv4/conf/#{item}/accept_redirects'
        owner 'root'
        group 'root'
        mode '0755'
        content '0'
      end
    end
  end
end

service "network" do
  action :restart
end

execute("verifying the status of SERVICES required by OpenSWAN") do
  retry_delay 2
  cookbook_name :vpn
  backup 5
  recipe_name "check_status"
  returns 0
  retries 0
  action [:run]
  command "sudo ipsec verify"
end