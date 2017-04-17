chef_gem "aws-sdk" do
  compile_time true
  action :install
end
require 'aws-sdk'

instance = search("aws_opsworks_instance", "self:true").first
ec2 = Aws::EC2::Client.new(region: 'us-east-2')
resp = ec2.authorize_security_group_ingress({
  group_id: node['api_security_group_id'],
  ip_permissions: [
    {
      ip_protocol: "tcp",
      from_port: 443,
      to_port: 443,
      ip_ranges: [
        {
          cidr_ip: "#{instance['public_ip']}/32",
        },
      ],
    },
  ],
})
