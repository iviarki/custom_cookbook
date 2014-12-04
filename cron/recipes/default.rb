if node[:opsworks][:instance][:hostname] == 'php-app1'
  cron "job_name" do
    hour "1"
    minute "10"
    weekday "6"
    command "cd /srv/www/myapp/current && php .lib/mailing.php"
  end
end
