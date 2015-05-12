  directory "#{deploy[:sample][:deploy_to]}" do
    group deploy[:group]
    owner deploy[:user]
    mode "0775"
    action :create
    recursive true
  end
