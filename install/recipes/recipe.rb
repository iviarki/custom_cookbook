execute 'p4vinst64_download' do
	cwd "C:\\"
	command 'powershell.exe Invoke-WebRequest -Uri http://www.perforce.com/downloads/perforce/r19.1/bin.ntx64/p4vinst64.exe -OutFile p4vinst64.exe' 
end 
execute 'p4vinst64_install' do 
	cwd "C:\\"
	command 'p4vinst64.exe /s /v/qn' 
end 
