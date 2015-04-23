route53 = Aws::Route53::Client.new(region: 'us-east-1')
resp = route53.change_resource_record_sets(
  #hosted_zone_id: "ResourceId",
  hosted_zone_id: "Z3SMY8KPAK9IH5",
  change_batch: {
    changes: [
      {
        action: "CREATE",
        resource_record_set: {
          #name: node[:opsworks][:instance][:hostname] + '.' + domain_name,
          name: "vpn2.tomzynski.co.za",
          type: "A",
          ttl: 60,
          resource_records: [
            {
              #value: node[:opsworks][:instance][:private_ip],
              value: "192.168.21.12",
            },
          ]
        }
      }
    ]
  }
)
