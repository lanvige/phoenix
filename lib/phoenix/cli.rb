require "rubygems"
require "thor"
require 'rails/generators/actions'
require 'phoenix/extension'

module Phoenix
  class CLI < Thor
    def self.basename
      "phoenix"
    end

    map "-v"        => "version"
    map "--version" => "version"

    
    desc "version", "print the current version"
    def version
      shell.say "Phoenix 0.0.2", :green
    end

    desc "extension NAME", "create a new extension with the given name"
    method_option "name", :type => :string
    def extension(name)
      invoke "phoenix:extension:generate", [options[:name] || name]
    end
  end
end