ruby_block "add-record" do
  block do
    require 'aws-sdk'
    route53 = ::AWS::Route53::Client.new(
      :access_key_id => "#{node[:dns_iam_key]}",
      :secret_access_key => "#{node[:dns_iam_secret]}")
    resp = route53.change_resource_record_sets(
      #hosted_zone_id: ResourceId,
      hosted_zone_id: "Z3SMY8KPAK9IH5",
      change_batch: {
        changes: [
          {
            action: "UPSERT",
            resource_record_set: {
              #name: node[:opsworks][:instance][:hostname] + '.' + domain_name,
              name: node[:opsworks][:instance][:hostname] + '.tomzynski.co.za',
              type: "A",
              ttl: 60,
              resource_records: [
                {
                  value: node[:opsworks][:instance][:private_ip]
                },
              ]
            }
          }
        ]
      }
    )
  end
  action :run
end

