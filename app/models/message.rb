class Message < ActiveRecord::Base
  attr_accessible :content, :from_number, :study_id, :to_number
end
