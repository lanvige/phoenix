unless defined?(Phonenix::InstallGenerator)
  #require 'generators/phoenix/install/install_generator'
end

desc "Generates a dummy app for testing"
namespace :common do
  task :test_app do
    require "#{ENV['LIB_NAME']}"
    
    Phoenix::DummyGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--quiet"]
    Phoenix::SiteGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--quiet"]
    # 
    # puts "Setting up dummy database..."
    # cmd = "bundle exec rake RAILS_ENV=test AUTO_ACCEPT=true"
    # 
    # if RUBY_PLATFORM =~ /mswin/ #windows
    #   cmd += " >nul"
    # else
    #   cmd += " >/dev/null"
    # end
    # 
    # system(cmd)
  end
end
