execute "makeswap" do
	command "mkswap /dev/xvdc"
end

execute "useswap" do
	command "swapon /dev/xvdc"
end