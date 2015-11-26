file "/tmp/layer_id" do
  content "#{node[:opsworks][:instance][:layers][0]}"
end
