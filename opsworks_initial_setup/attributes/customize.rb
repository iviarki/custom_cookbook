# Remove /var/www from mount
#default[:opsworks_initial_setup][:bind_mounts][:mounts] = {
#'/var/log/mysql' => "#{node[:opsworks_initial_setup][:ephemeral_mount_point]}/var/log/mysql",
#'/srv/www' => "#{node[:opsworks_initial_setup][:ephemeral_mount_point]}/srv/www"
#}
default[:opsworks_initial_setup][:ephemeral_mount_point] = "/var/log"
