unless defined?(Phonenix::InstallGenerator)
  # why i can't find the path under root?
  # require 'generators/phoenix/install/install_generator'
end

desc "Generates a dummy app for testing"
namespace :common do
  task :test_app do
    require "#{ENV['LIB_NAME']}"
    
    Phoenix::DummyGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--quiet"]
    Phoenix::InstallGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--quiet", "--auto-accept", "--skip-install-data"]
    
    puts "Setting up dummy database..."
    cmd = "bundle exec rake RAILS_ENV=test AUTO_ACCEPT=true"
    
    if RUBY_PLATFORM =~ /mswin/ #windows
      cmd += " >nul"
    else
      cmd += " >/dev/null"
    end
    
    system(cmd)
  end
end
