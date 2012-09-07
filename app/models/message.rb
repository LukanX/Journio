class Message < ActiveRecord::Base
  attr_accessible :content, :from_number, :study_id, :to_number
  belongs_to :study

  validates :content, presence: true, length: { maximum: 160 }

end
