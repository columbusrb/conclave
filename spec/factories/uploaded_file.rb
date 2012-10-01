FactoryGirl.define do
  factory :uploaded_file do
    association :comment
    file_file_name "TestingFile.pdf"
    file_content_type "application/pdf"
    file_file_size 12345
    file_updated_at Time.now
  end
end
