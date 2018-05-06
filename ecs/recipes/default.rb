ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/ecs/ecs.config")
    file.insert_line_if_no_match("/ECS_RESERVED_MEMORY=2048/", "ECS_RESERVED_MEMORY=2048")
    file.write_file
  end
end

service "docker" do
  action :restart
end

execute "Run the Amazon ECS agent" do
  command ["/usr/bin/docker",
           "run",
           "--name ecs-agent",
           "-d",
           "-v /var/run/docker.sock:/var/run/docker.sock",
           "-v /var/log/ecs:/log",
           "-v /var/lib/ecs/data:/data",
           "-p 127.0.0.1:51678:51678",
           "--env-file /etc/ecs/ecs.config",
           "amazon/amazon-ecs-agent:latest"].join(" ")

  only_if do
    ::File.exist?("/usr/bin/docker") && !OpsWorks::ShellOut.shellout("docker ps -a").include?("amazon-ecs-agent")
  end

  retries 1
  retry_delay 5
end
