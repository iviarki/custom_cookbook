adminapp = search(:node, "apps:admin").first
Chef::Log.info("**********Admin App is: '#{adminapp[:name]}'**********")

file "/tmp/variable" do
  content "#{adminapp[:name]}"
  mode 0644
  action :create
end
