chef_gem "aws-sdk" do
  action :install
end
gem 'aws-sdk'
require 'aws-sdk'

stack = search("aws_opsworks_stack").first
tag = stack['name']+ '-'

instance = search("aws_opsworks_instance", "self:true").first
tag += instance['hostname']

search("aws_opsworks_layer").each do |layer|
  if instance['layer_ids'].include? layer['layer_id']
    tag += layer['name']+ '-'
  end
end

ec2 = Aws::EC2::Client.new( :region => "eu-west-1" )
ec2.create_tags({
  resources: [instance['ec2_instance_id']],
  tags: [{ key: "OpsWorksTag",
    value: layer['name'] }]
})
