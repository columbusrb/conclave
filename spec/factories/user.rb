FactoryGirl.define do
  factory :user, aliases: [:creator] do
    sequence(:email) {|n| "person#{n}@example.com"}
    password 'please'
    password_confirmation 'please'
  end
end
