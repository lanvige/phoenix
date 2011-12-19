Rails.application.routes.draw do
  <%= 'mount Phoenix::Core::Engine => "/"' if defined?(Phoenix::Core) %>
end
