powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
        code 'start-process -FilePath "p4vinst64.exe" -ArgumentList "/s /v/qn" -Verb runas -wait'
end 
