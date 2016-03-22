#gem 'aws-sdk'
chef_gem "aws-sdk" do
  compile_time false
  action :install
end
require 'aws-sdk'
instance = search("aws_opsworks_instance").first
toTag = Array.new
toTag.push(instance['instance_id'])
ec2 = Aws::EC2::Client.new( :region => "us-east-1")
instance_attributes = ec2.describe_instance_attribute({
  instance_id: instance['instance_id'],
  attribute: "blockDeviceMapping"
})
instance_attributes.block_device_mappings.each do|mapping|
  toTag.push(mapping.ebs.volume_id)
end
tag_instance = ec2.create_tags({
  resources: toTag,
  tags: node['state']
})
