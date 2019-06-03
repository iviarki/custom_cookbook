powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code 'Start-Process -FilePath C:\p4vinst64.exe -ArgumentList "/s /v/qn" Bypass -Wait -Debug -Verbose'
	flags '-ExecutionPolicy Bypass'
end 
