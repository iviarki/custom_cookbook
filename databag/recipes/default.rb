command = search("aws_opsworks_command").first
Chef::Log.info("********** The command's type is '#{command['type']}' **********")
Chef::Log.info("********** The command was sent at '#{command['sent_at']}' **********")
Chef::Log.info("********** The command was sent at '#{command['iam_user_arn']}' **********")
