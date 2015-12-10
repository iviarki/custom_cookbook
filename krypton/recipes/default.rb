app = search(:aws_opsworks_app, "name:krypton").first
app[:environment][:newrelic_key]


template "/etc/newrelic/nrsysmond.cfg" do
  source "nrsysmond.cfg.erb"
  variables ({
    :newrelic_key => app[:environment][:newrelic_key],
  })
  user "root"
  group "newrelic"
  mode "0644"
end
