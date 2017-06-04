command = search("aws_opsworks_command").first

def get_iam_user(command_id)
  Chef::Log.info("********** Ran function **********")
  # Ensure aws-sdk is installed and create OpsWorks Client
  chef_gem "aws-sdk" do
    action :install
    compile_time true
  end
  require 'aws-sdk'
  client = Aws::OpsWorks::Client.new(
    region: search("aws_opsworks_stack").first['region']
  )

  # Get deployment ID
  command_resp = client.describe_commands({
    command_ids: [command_id]
  })
  deployment_id = command_resp.commands[0].deployment_id

  # Get IAM User from Deployment ID
  deployment_resp = client.describe_deployments({
    deployment_ids: [deployment_id],
  })
  return deployment_resp.deployments[0].iam_user_arn
end

Chef::Log.info("********** Command issued by: '#{command['iam_user_arn'] ? command['iam_user_arn'] : get_iam_user(command['command_id'])}' **********")
