app = search(:aws_opsworks_app, "name:krypton").first
Chef::Log.info("Appenv: #{app[:environment][:newrelic_key]}")
