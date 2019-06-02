windows_package 'Microsoft Visual C++ 2005 Redistributable' do
  source 'http://www.perforce.com/downloads/perforce/r19.1/bin.ntx64/p4vinst64.exe'
  installer_type :custom
  options '/s /v/qn'
end
