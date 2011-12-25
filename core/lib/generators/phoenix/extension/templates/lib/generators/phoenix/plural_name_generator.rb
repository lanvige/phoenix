module Phoenix
  class <%= class_name.pluralize %>Generator < Rails::Generators::Base

    source_root File.expand_path('../../../../', __FILE__)

    def rake_db
      rake("phoenix_<%= plural_name %>:install:migrations")
    end

  end
end
