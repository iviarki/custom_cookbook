package 'nginx' do
  action :install
end

service 'nginx' do
  action :start
end

layer = search("aws_opsworks_layer", "name:nginx").first
Chef::Log.info("********** Layer: '#{layer}' **********")
instances = search("aws_opsworks_instance", "layer:#{layer.layer_id}")
Chef::Log.info("********** Instances: '#{instances}' **********")

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :instances => instances
  )
  notifies :reload, 'service[nginx]'
end

