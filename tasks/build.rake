ENGINES = %w{ core authentication }

require File.expand_path('../../core/lib/phoenix/version', __FILE__)
version = Phoenix::Version.to_s

root = File.expand_path('../../', __FILE__)

(ENGINES + ['phoenix']).each do |engine|
  namespace engine do
    engine_name = engine
    engine_name = "phoenix_#{engine}" unless engine == "phoenix"
    
    gem_filename = "pkg/#{engine_name}-#{version}.gem"
    gemspec = "#{engine_name}.gemspec"
    
    task :clean_gem do
      package_dir = "#{root}/pkg"
      mkdir_p package_dir unless File.exists?(package_dir)
      rm_f gem_filename
    end
    
    task :package do
      cmd = ""
      cmd << "cd #{engine} && " unless engine == "phoenix"
      cmd << "gem build #{gemspec} && mv #{engine_name}-#{version}.gem #{root}/pkg/"
      sh cmd
    end
    
    task :install_gem do
      cmd = ""
      cmd << "gem install  #{root}/pkg/#{engine_name}-#{version}.gem"
      sh cmd
    end

    task  :uninstall_gem do
      cmd = ""
      cmd << "gem uninstall #{engine_name} -a"
      sh cmd
    end
    
    task  :publish_gem do
      cmd = ""
      cmd << "gem push #{engine_name}"
      sh cmd
    end
    

    task :build_gem => [:clean_gem, :package]
  end
end

namespace :phoenix do
  task :clean => ENGINES.map { |e| "#{e}:clean_gem" } + ['phoenix:clean_gem']
  task :build => ENGINES.map { |e| "#{e}:build_gem" } + ['phoenix:build_gem']
  task :install => ENGINES.map { |e| "#{e}:install_gem" } + ['phoenix:install_gem']
  task :uninstall => ENGINES.map { |e| "#{e}:uninstall_gem" } + ['phoenix:uninstall_gem']
  task :publish => ENGINES.map { |e| "#{e}:publish_gem" } + ['phoenix:publish_gem']
end
