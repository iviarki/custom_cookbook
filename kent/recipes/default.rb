node['opsworks']['instance']['layers'].each do | layer |
  link = node[layer]["S3Link"]
  Chef::Log.info("********** The app's initial background color is '#{link}' **************")
end
