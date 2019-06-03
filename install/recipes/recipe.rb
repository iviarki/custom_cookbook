powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code 'Start-Process -FilePath C:\p4vinst64.exe -ArgumentList '/s /v"/l*v \"c:\p4v.log\" /qn' -LoadUserProfile -NoNewWindow -PassThru -RedirectStandardError C:\error.txt -RedirectStandardOutput c:\std.txt -Wait -Debug -Verbose'
end 
