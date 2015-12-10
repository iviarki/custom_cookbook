node[:aws_opsworks_agent][:command][:args][:app_ids].each do |appid|
  node[:aws_opsworks_agent][:resources][:apps].each do |app|
    if app[:app_id] == appid
        template "/tmp/nrsysmond.cfg" do
            source "test.cfg.erb"
            variables ({
             :newrelic_key => node[:app][:environment][:newrelic_key]
            })
            user "root"
            group "root"
            mode "0644"
        end
    end
 end
end
 
