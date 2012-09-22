FactoryGirl.define do
  factory :conversation, class: Conversation do
    title "Conversation Title"
    association :forum
  end
end
