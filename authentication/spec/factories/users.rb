# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => Phoenix::User do
    sequence(:name) { |n| "phoenix#{n}" }
    sequence(:email) { |n| "pe#{n}@phoenixproject.org" }
    password "phoenix"
    password_confirmation "phoenix"

    confirmed_at Time.now
  end
end
