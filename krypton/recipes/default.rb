template "/etc/newrelic/nrsysmond.cfg" do
    source "nrsysmond.cfg.erb"
    variables ({
        :newrelic_key => node[:deploy]['krypton'][:environment_variables][:NEWRELIC_KEY],
        :hostname => "#{node[:opsworks][:instance][:region]}-#{node[:opsworks][:instance][:hostname]}"
    })
   user "root"
   group "newrelic"
   mode "0644"
end
