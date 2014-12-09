execute "makeswap"
	command "mkswap /dev/xvdc"
end

execute "useswap"
	command "swapon /dev/xvdc"
end