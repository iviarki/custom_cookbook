default[:opsworks_initial_setup][:bind_mounts][:mounts] = {
  "/var/log" => "#{node[:opsworks_initial_setup][:ephemeral_mount_point]}/var/log",
  '/srv/www' => "#{node[:opsworks_initial_setup][:ephemeral_mount_point]}/srv/www",
  '/var/www' => "#{node[:opsworks_initial_setup][:ephemeral_mount_point]}/var/www",
}
