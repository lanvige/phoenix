require "rubygems"
require "phoenix/version"
require "thor"
require "generators/phoenix/extension_generator"

module Phoenix
  class CLI < Thor
    def self.basename
      "phoenix"
    end

    map "-v"        => "version"
    map "--version" => "version"

    desc "version", "print the current version"
    def version
      shell.say "Phoenix Engine #{Phoenix::Version}", :green
    end

    desc "app NAME", "create a new application with the given name"
    method_option "name", :type => :string
    def app(name)
      Phoenix::AppGenerator.start
    end

    desc "extension NAME", "create a new extension with the given name"
    method_option "name", :type => :string
    def extension(name)
      invoke "phoenix:extension:generate", [options[:name] || name]
    end
  end
end

