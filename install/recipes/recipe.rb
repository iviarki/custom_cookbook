powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code 'Start-Process -FilePath C:\p4vinst64.exe -ArgumentList "/s /v/qn" -Wait -Debug -Verbose -PassThru -Verb RunAs -LoadUserProfile'
        flags '-ExecutionPolicy Bypass'
end 
