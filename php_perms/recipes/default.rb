Chef::Log.info("Running Permissions Recipe")

execute "chown-data-www" do
  command "chown -R www-data:www-data /var/www/myfoler"
  user "root"
  action :run
end

execute "chmod-data-www" do
  command "chmod -R 777 /var/www/myfoler"
  user "root"
  action :run
end