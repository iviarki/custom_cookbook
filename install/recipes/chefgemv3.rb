chef_gem "aws-sdk" do
  compile_time true
  action :install
  version "2.11.311"
end

Chef::Log.info("SDK Install complete")

Gem.clear_paths()

Chef::Log.info("Gem Clear Paths")
