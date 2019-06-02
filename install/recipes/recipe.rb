powershell_script 'p4vinst64_install' do 
	cwd "C:\\"
	code '.\p4vinst64.exe /s /v/qn' 
	flags "-NoLogo, -NonInteractive, -NoProfile, -ExecutionPolicy Unrestricted, -InputFormat None, -File"
end 
