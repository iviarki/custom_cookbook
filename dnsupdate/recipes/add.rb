include_recipe "route53"

route53_record "create a record" do
  name  node[:opsworks][:instance][:hostname] + '.tomzynski.co.za'
  value node[:opsworks][:instance][:private_ip]
  type  "A"
  ttl   60
  zone_id               'Z3SMY8KPAK9IH5'
  aws_access_key_id     node[:dns_iam_key]
  aws_secret_access_key node[:dns_iam_secret]
  overwrite true
  action :create
end