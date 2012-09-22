FactoryGirl.define do
  factory :comment do
    content "Comment Content"
    conversation
    user
  end
end

