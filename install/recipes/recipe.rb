windows_package 'PuTTY version 0.60' do
  source 'http://www.perforce.com/downloads/perforce/r19.1/bin.ntx64/p4vinst64.exe'
  installer_type :custom
  action :install
  options '/v"/l*v+ c:\p4vinst.log"'
end
