FactoryGirl.define do
  factory :user, :class => Phoenix::User do
    sequence(:name) { |n| "phoenix#{n}" }
    sequence(:email) { |n| "phoenix#{n}@refinerycms.com" }
    password "phoenix"
    password_confirmation "phoenix"
  end
end
