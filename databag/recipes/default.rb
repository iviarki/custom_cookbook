instance = search("aws_opsworks_instance", "self:true").first
hostname = instance['hostname']
Chef::Log.info("Hostname: #{hostname}")
layer_ids = instance['layer_ids']
elb_type = "none"
layer_ids.each do |layer|
	shortname = search("aws_opsworks_layer", "layer_id:" + layer).first['shortname']
	case shortname
	when "proxylayer", "haproxylayer"
		elb_type = "proxy"
	when "railslayer", "phplayer"
		elb_type = "app"
	when "foolayer11"
		elb_type = "foo"
	end
end
Chef::Log.info(elb_type)
stack = search(:aws_opsworks_stack).first
ec2_region = stack['region']
Chef::Log.info("Region: #{ec2_region}")
layer = search(:aws_opsworks_layer)
layer_name = layer[0]['name']
Chef::Log.info("Layer: #{layer_name}")
