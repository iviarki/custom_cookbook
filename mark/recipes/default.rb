if node['opsworks']['deployment']
  Chef::Log.info("Executed during deployment lifecycle [opsworks][deployment]: #{node['opsworks']['deployment']} app")
else
  Chef::Log.info("Executed during deployment lifecycle [opsworks][deployment]: Error")
end
