powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code '.\p4vinst64.exe /s /v/qn' 
	elevated true
	user "Administrator"
	password "Lw@?GorJ9?E"
	flags "-NoLogo, -NonInteractive, -NoProfile, -ExecutionPolicy Unrestricted, -InputFormat None, -File"
end 
