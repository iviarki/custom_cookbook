package "postgresql-devel" do
  package_name value_for_platform(
    ["centos","redhat","fedora","amazon"] => {"default" => "postgresql94-devel"},
    "ubuntu" => {"default" => "libpq-dev"}
  )
  action :install
end

package "postgresql-client" do
  package_name value_for_platform(
    ["centos","redhat","fedora","amazon"] => {"default" => "postgresql94"},
    "default" => "postgresql-client"
  )
  action :install
end
