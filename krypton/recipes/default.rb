node[:command][:args][:app_ids].each | appid
  node[:resources][:apps].each | app
    if app[:app_id]?(appid)
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
 
