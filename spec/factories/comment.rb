FactoryGirl.define do
  factory :comment, class: Comment do
    content "Comment Content"
    association :conversation
    association :user
  end
end

