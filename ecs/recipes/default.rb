ecs = Aws::ECS::Client.new
ecs.operation_names

require 'aws-sdk'

puts client.list_container_instances({
  cluster: "test2"
})

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/ecs/ecs.config")
    file.insert_line_if_no_match("/ECS_RESERVED_MEMORY=2048/", "ECS_RESERVED_MEMORY=2048")
    file.write_file
  end
end

execute "Restart ECS agent" do
  command "docker restart $(docker ps -a | grep amazon-ecs-agent | awk '{print $1}')"
end
