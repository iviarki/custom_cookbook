instance = search("aws_opsworks_instance", "self:true").first
hostname = instance['hostname']
Chef::Log.info("Hostname: #{"hostname")
layer_ids = instance['layer_ids']
layer_ids.each do |layer|
	Chef::Log.info("Layer ID: #{layer)
	Chef::Log.info("Layer Name: #{search("aws_opsworks_layer", "layer_id:" + layer).first['name']}")
end
stack = search(:aws_opsworks_stack).first
ec2_region = stack['region']
Chef::Log.info("Region: #{ec2_region}")
layer = search(:aws_opsworks_layer)
layer_name = layer[0]['name']
Chef::Log.info("Region: #{layer_name}")
