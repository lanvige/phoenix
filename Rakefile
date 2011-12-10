#!/usr/bin/env rake
require 'rake'
require 'rubygems/package_task'

spec = eval(File.read('phoenix.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

namespace :gem do
  desc "run rake gem for all gems"
  task :build do
    %w(core auth social).each do |gem_name|
      puts "--------------Rebuild PHOENIX #{gem_name} GEM---------------------"
      puts "Deleting #{gem_name}/pkg"
      FileUtils.rm_rf("#{gem_name}/pkg")
      cmd = "cd #{gem_name} && bundle exec rake gem"; puts cmd; system cmd
    end
    
    puts "Deleting pkg directory"
    FileUtils.rm_rf("pkg")
    cmd = "bundle exec rake gem"; puts cmd; system cmd
  end

  desc "run gem install for all gems"
  task :install do
    version = File.read(File.expand_path("../PHOENIX_VERSION", __FILE__)).strip

    %w(core auth social).each do |gem_name|
      puts "----------Rebuild PHOENIX #{gem_name} and install the GEM-----------"
      puts "Deleting #{gem_name}/pkg"
      FileUtils.rm_rf("#{gem_name}/pkg")
      cmd = "cd #{gem_name} && bundle exec rake gem"; puts cmd; system cmd
      cmd = "cd #{gem_name}/pkg && gem install phoenix_#{gem_name}-#{version}.gem"; puts cmd; system cmd
    end
    
    puts "----------------Rebuild PHOENIX and install the GEM------------------"
    FileUtils.rm_rf("./pkg")
    cmd = "bundle exec rake gem"; puts cmd; system cmd
    cmd = "gem install pkg/phoenix-#{version}.gem"; puts cmd; system cmd
  end
end

desc "clean the whole repository by removing all the generated files"
task :clean do
  puts "Deleting sandbox..."
  FileUtils.rm_rf("sandbox")
  puts "Deleting pkg directory.."
  FileUtils.rm_rf("pkg")

  %w(core auth social).each do |gem_name|
    puts "Cleaning #{gem_name}:"
    puts "  Deleting #{gem_name}/Gemfile"
    FileUtils.rm_f("#{gem_name}/Gemfile")
    puts "  Deleting #{gem_name}/pkg"
    FileUtils.rm_rf("#{gem_name}/pkg")
    puts "  Deleting #{gem_name}'s dummy application"
    Dir.chdir("#{gem_name}/spec") do
      FileUtils.rm_rf("dummy")
    end
  end
end