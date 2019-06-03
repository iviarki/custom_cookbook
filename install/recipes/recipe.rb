powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code 'start-process -FilePath "C:\p4vinst64.exe" -ArgumentList "/s /v/qn" -Verb runas -Wait'
end 
