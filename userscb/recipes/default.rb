chef_gem "aws-sdk" do
  action :install
end

opsworks = Aws::OpsWorks::Client.new()


def add_user(username)
  Chef::Log.info("adding #{username} to stack: #{node[:opsworks][:stack][:name]}")
  #get_stackid()
  begin
  Chef::Log.info("about to create user")
  user_resp = $opsworks.set_permission({
    stack_id: node[:opsworks][:stack][:id],
    iam_user_arn: "arn:aws:iam::371814697373:user/#{username}",
    allow_ssh: true,
    allow_sudo: true,
    level: "manage",
  })
  rescue Aws::OpsWorks::Errors::ServiceError
  end
end

add_user("iviarki")
