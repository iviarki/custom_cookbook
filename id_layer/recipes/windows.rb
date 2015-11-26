layer_name = search(:aws_opsworks_layer, "name")

file 'C:\\something.txt' do
  content "#{layer_name}"
end
