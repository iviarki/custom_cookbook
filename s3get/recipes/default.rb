s3_file "/tmp/somefile" do
    remote_path "/my/s3/key"
    bucket "my-s3-bucket"
    aws_access_key_id "mykeyid"
    aws_secret_access_key "mykey"
    s3_url "https://s3.amazonaws.com/bucket"
    owner "me"
    group "mygroup"
    mode "0644"
    action :create
    decryption_key "my SHA256 digest key"
    decrypted_file_checksum "SHA256 hex digest of decrypted file"
end
