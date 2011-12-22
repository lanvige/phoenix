ENGINES = %w{ settings core auth social testing }

require File.expand_path('../../core/lib/phoenix/version', __FILE__)
version = Phoenix::Version.to_s

root = File.expand_path('../../', __FILE__)

(ENGINES + ['phoenix']).each do |engine|
  namespace engine do
    engine_name = engine
    engine_name = "phoenix_#{engine}" unless engine == "phoenix"
    
    gem_filename = "pkg/#{engine_name}-#{version}.gem"
    gemspec = "#{engine_name}.gemspec"
    
    task :clean do
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
    
    task :install do
      cmd = ""
      cmd << "cd #{engine} && " unless engine == "phoenix"
      cmd << "gem install  #{root}/pkg/#{engine_name}-#{version}.gem"
      sh cmd
    end

    task  :uninstall do
      cmd = ""
      cmd << "gem uninstall #{engine_name}.gem -a"
      sh cmd
    end

    task :rebuild => [:clean, :package]
  end
end

namespace :phoenix do
  task :cleanup => ENGINES.map { |e| "#{e}:clean" } + ['phoenix:clean']
  task :build => ENGINES.map { |e| "#{e}:rebuild" } + ['phoenix:rebuild']
  task :install => ENGINES.map { |e| "#{e}:install" } + ['phoenix:install']
  task :uninstall => ENGINES.map { |e| "#{e}:uninstall" } + ['phoenix:uninstall']
end
