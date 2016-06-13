chef_gem "aws-sdk" do
  action :install
end
gem 'aws-sdk'
require 'aws-sdk'
tags = []

instance = search("aws_opsworks_instance", "self:true").first
tags.push({ key: "OWInstance",
  value: instance['hostname'] })

search("aws_opsworks_layer").each do |layer|
  if instance['layer_ids'].include? layer.layer_id
    tags.push({ key: "OWLayer",
      value: layer['name'] })
  end
end

stack = search("aws_opsworks_stack").first
tags.push({ key: "OWStack",
  value: stack['name'] })

ec2 = Aws::EC2::Client.new( :region => "eu-west-1" )
ec2.create_tags({
  resources: [instance['ec2_instance_id']],
  tags: tags
})
