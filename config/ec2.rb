namespace :ec2 do
  
  desc "Remotely login to the running instance"
  task :ssh do
    system "ssh -i #{keypair_full_path} #{username}@#{instance_url}"
  end
  
  desc "Copy public key from instance to $HOME/.ec2"
  task :cp_public_key do
    system "scp -i #{keypair_full_path} #{username}@#{instance_url}:/mnt/openssh_id.pub #{ec2_dir}/id_rsa-#{keypair}.pub"
  end
  
  task :start do
    system "ec2-run-instances #{image_id} -k #{keypair}"
  end

  task :stop do
    system "ec2-terminate-instances #{instance_id}"
  end
  
end