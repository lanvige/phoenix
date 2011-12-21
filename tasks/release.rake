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
    
    task :build => [:clean, :package]
  end
end

namespace :all do
  task :build => ENGINES.map { |e| "#{e}:build" } + ['phoenix:build']
end
