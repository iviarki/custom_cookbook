layer = search("aws_opsworks_layer", "name:nginx").first
Chef::Log.info("********** Layer: '#{layer}' **********")
instances = search("aws_opsworks_instance", "layer_ids:'#{layer['layer_id']}'")
Chef::Log.info("********** Instances: '#{instances}' **********")

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :instances => instances
  )
  notifies :reload, 'service[monit]'
end

