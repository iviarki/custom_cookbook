chef_gem "aws-sdk" do
  action :install
end
gem 'aws-sdk'
require 'aws-sdk'

unless node["opsworks"]["instance"]["hostname"].include?("worker")
  elasticloadbalancingClient = Aws::ElasticLoadBalancing::Client.new()
  attach = elasticloadbalancingClient.register_instances_with_load_balancer({
    load_balancer_name: node['rails_elb_name'],
    instances: [{
      instance_id: node["opsworks"]["instance"]["aws_instance_id"]
    }]
  })
end
