user_home = "/home/#{node[:user]}"

user node[:user] do
   shell '/bin/bash'
   home user_home
   system true
   action :create
end

directory "#{user_home}/.ssh" do
   owner node[:user]
   recursive true
end

file "#{user_home}/.ssh/id_rsa" do
   content "Sample Text"
   owner node[:user]
   mode 0400
end
