app = search(:aws_opsworks_app, "name:krypton").first

template "/tmp/nrsysmond.cfg" do
  source "test.conf.erb"
  variables ({
    :newrelic_key => app[:environment][:newrelic_key],
  })
  user "root"
  group "root"
  mode "0644"
end
