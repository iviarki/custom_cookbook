define :opsworks_deploy do
  application = params[:app]
  deploy = params[:deploy_data]
   
  directory "#{deploy[:deploy_to]}" do
    group deploy[:group]
    owner deploy[:user]
    mode "0775"
    action :create
    recursive true
  end
end
