powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code 'Start-Process -FilePath C:\p4vinst64.exe -ArgumentList "/s /v/qn" -Wait -Debug -Verbose -PassThru -Verb RunAs'
        flags '-ExecutionPolicy Bypass'
	user 'Administrator'
	password 'Lw@?GorJ9?E'
end 
