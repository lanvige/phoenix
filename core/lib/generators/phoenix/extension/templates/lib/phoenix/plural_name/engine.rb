require 'phoenix_<%= plural_name %>'

module Phoenix
  module <%= class_name.pluralize %>
    class Engine < Rails::Engine
      include Phoenix::Engine
      isolate_namespace Phoenix
      engine_name :phoenix_<%= plural_name %>

      initializer "register phoenix_<%= plural_name %> plugin" do |app|
        Phoenix::Plugin.register do |plugin|
          plugin.name = "<%= class_name.pluralize.underscore.downcase %>"
          plugin.url = {:controller => '/phoenix/<%= plural_name %>'}
          plugin.pathname = root
          plugin.name = '<%= class_name.pluralize.underscore.downcase %>'
          plugin.url = '/phoenix/<%= plural_name %>'

          plugin.activity = {
            :class_name => :'phoenix/<%= singular_name %>'
          }
        end
      end

      config.after_initialize do
        Phoenix.register_engine(Phoenix::<%= class_name.pluralize %>)
      end
    end
  end
end
