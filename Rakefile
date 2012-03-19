require 'vagrant'
desc "Run vagrant up"
task :up do
  puts "starting to run vagrant up"
  env = Vagrant::Environment.new
  env.cli('up')
  puts "complete"
end
desc "Run vagrant halt"
task :halt do
  puts "Graceful shutdown of server starting"
  env = Vagrant::Environment.new
  raise "Must first run rake up" if !env.primary_vm.created?
  rasie "There is no VM running" if env.primary_vm.state != :running
  env.cli('halt')
  puts "Shutdown of server complete"
end

# Symfony tasks that are all ran on the VM
namespace 'symfony' do
  # cache tasks
  namespace 'cache' do
    desc "Clear the symfony cache"
    task :clear do
      puts "clearing symfony cache"
      env = Vagrant::Environment.new
      raise "Must first run rake up" if !env.primary_vm.created?
      rasie "There is no VM running" if env.primary_vm.state != :running
      env.primary_vm.channel.execute('cd /vagrant; php symfony cc');
      puts "cahce has been cleared"
    end
  end

  # project tasks
  namespace 'project' do
    desc "Make sure the permissions are set to what they need to be"
    task :permissions do
      puts "setting up permissions"
      env = Vagrant::Environment.new
      raise "Must first run rake up" if !env.primary_vm.created?
      rasie "There is no VM running" if env.primary_vm.state != :running
      env.primary_vm.channel.execute('cd /vagrant; php symfony project:permissions');
      puts "permissions have been set"
    end
  end
end
