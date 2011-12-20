<% if (title = attributes.detect { |a| a.type.to_s == "string" }).present? %>
FactoryGirl.define do
  factory :<%= singular_name %>, :class => Phoenix::<%= class_name.pluralize %>::<%= class_name %> do
    sequence(:<%= title.name %>) { |n| "phoenix#{n}" }
  end
end
<% end %>
