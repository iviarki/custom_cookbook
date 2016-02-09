adminapp = search(:node, "name:admin").first
Chef::Log.info("**********Admin App is: '#{adminapp[:name]}'**********")

file "/tmp/variable" do
  content "#{adminapp[:name]}"
  mode 0644
  action :create
end
