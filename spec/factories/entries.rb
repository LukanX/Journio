# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    content "MyString"
    participant_id 1
  end
end
