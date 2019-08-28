layer = search("aws_opsworks_layer", "name:nginx").first
Chef::Log.info("********** Layer: '#{layer}' **********")
instances = search("aws_opsworks_instance")
Chef::Log.info("********** Instances: '#{instances}' **********")

nginx_instances = instances.select do |i|
  i['layer_ids'].include? layer['layer_id']
end
Chef::Log.info("********** Nginx Instances: '#{nginx_instances}' **********")
execute 'output' do
  command 'echo "Output command has run"'
  action :nothing
end

template '/etc/bob' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :instances => nginx_instances
  )
  notifies :run, 'execute[output]'
end

