cron "job_name" do
  hour "1"
  minute "10"
  weekday "6"
  command "php .lib/mailing.php"
end
