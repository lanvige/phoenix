require 'refinerycms-<%= plural_name %>'

module Phoenix
  module <%= class_name.pluralize %>
    class Engine < Rails::Engine
      include Phoenix::Engine
      isolate_namespace Phoenix
      engine_name :refinery_<%= plural_name %>

      initializer "register refinerycms_<%= plural_name %> plugin" do |app|
        Phoenix::Plugin.register do |plugin|
          plugin.name = "<%= class_name.pluralize.underscore.downcase %>"
          plugin.url = {:controller => '/refinery/<%= plural_name %>'}
          plugin.pathname = root
          plugin.name = '<%= class_name.pluralize.underscore.downcase %>'
          plugin.url = '/refinery/<%= plural_name %>'

          plugin.activity = {
            :class_name => :'refinery/<%= singular_name %>'
          }
        end
      end

      config.after_initialize do
        Phoenix.register_engine(Phoenix::<%= class_name.pluralize %>)
      end
    end
  end
end
