# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scheduled_message do
    message "MyString"
    phone_number "MyString"
    scheduled_at "2012-12-05 10:37:47"
    sent_at "2012-12-05 10:37:47"
    study_id 1
  end
end
