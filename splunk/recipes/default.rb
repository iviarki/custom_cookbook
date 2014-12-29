remote_file "/tmp/splunk.rpm" do
  source "https://www.splunk.com/page/download_track?file=6.2.1/splunk/linux/splunk-6.2.1-245427-linux-2.6-x86_64.rpm&platform=Linux&architecture=x86_64&version=6.2.1&product=splunk&typed=release&name=linux_installer&d=pro&wget=true"
end

package "splunk" do
  action :install
  source "/tmp/splunk.rpm"
end
