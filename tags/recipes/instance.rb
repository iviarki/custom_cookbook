chef_gem "aws-sdk" do
  action :install
end
gem 'aws-sdk'
require 'aws-sdk'
instance = search("aws_opsworks_instance", "self:true").first
ec2 = Aws::EC2::Client.new( :region => "eu-west-1" )
ec2.create_tags({
  resources: [instance['ec2_instance_id']],
  tags: { key: "OWLayer",
    value: "OpsWorksRG1" }
})
