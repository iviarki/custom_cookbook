node['apps'].each do |app|
  resultapp = search(:aws_opsworks_app, "name:#{app}".first
  file "/tmp/#{resultapp[:name]}" do
    content "#{resultapp[:name]}"
    mode 0644
    action :create
  end
end
