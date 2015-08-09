execute "umounteph" do
	command "umount /dev/xvdb"
end

execute "mountvarlog" do
	command "mount /dev/xvdb /var/log"
end
