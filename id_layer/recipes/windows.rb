host_name = Socket.gethostname

file 'C:\\hostname.txt' do
  content "#{host_name}"
end


layer_name = search(:node)

file 'C:\\something.txt' do
  content "#{layer_name[:name]}"
end
