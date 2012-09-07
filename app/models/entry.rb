class Entry < ActiveRecord::Base
  attr_accessible :content, :participant_id, :type
  belongs_to :participant

  validates :content, presence: true, length: { maximum: 160 }
end
