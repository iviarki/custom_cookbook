instance = search(:node).first

instance_details = search(:aws_opsworks_instance, "hostname:#{instance[:hostname]}").first

file 'C:\\layer.txt' do
  content "#{instance_details[:role]}"
end

