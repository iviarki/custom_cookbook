if node['apt']['compile_time_update'] && ( !::File.exist?('/var/lib/apt/periodic/update-success-stamp') || !::File.exist?(first_run_file) )
  cron "job_name" do
    hour "1"
    minute "10"
    weekday "6"
    command "cd /srv/www/myapp/current && php .lib/mailing.php"
  end
end
