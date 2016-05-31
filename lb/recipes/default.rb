chef_gem "aws-sdk" do
  compile_time true
  action :install
end
gem 'aws-sdk'
require 'aws-sdk'
instance = search("aws_opsworks_instance", "self:true").first

if instance['hostname'].exclude? "worker" do
  elasticloadbalancingClient = Aws::ElasticLoadBalancing::Client.new()
  attach = elasticloadbalancingClient.register_instances_with_load_balancer({
    load_balancer_name: node['rails_elb_name'],
    instances: [{
      instance_id: instance['ec2_instance_id']
    }]
  })
end
