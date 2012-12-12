# == Schema Information
#
# Table name: studies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Study < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :participants, dependent: :destroy
  has_many :scheduled_messages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 140 }
end
