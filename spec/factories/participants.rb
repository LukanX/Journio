# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    name "MyString"
    email "MyString"
    phone_number "MyString"
    study_id 1
  end
end
