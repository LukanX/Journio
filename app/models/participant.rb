class Participant < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :study_id
  belongs_to :study

  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, length: { maximum: 10 }
  validates :study_id, presence: true

  def send_sms(message)

    twilio_sid = "ACe105d35539084e82b0b6c678c9d31d45"
    twilio_token = "77eee3539875f303400e4ad10f17f26c"
    twilio_phone_number = "2025688504"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => phone_number,
      :body => message
    )
  end
end
