class Participant < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :study_id
  belongs_to :study

  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, length: { maximum: 10 }
  validates :study_id, presence: true
end
