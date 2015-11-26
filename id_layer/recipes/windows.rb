file 'C:\\something.txt' do
  content "#{node[:opsworks][:instance][:layers][0]}"
end
