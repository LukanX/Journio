# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    to_number "MyString"
    from_number "MyString"
    content "MyString"
    study_id 1
  end
end
