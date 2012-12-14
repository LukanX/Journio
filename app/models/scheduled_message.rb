class ScheduledMessage < ActiveRecord::Base
  attr_accessible :message, :phone_number, :scheduled_at, :sent_at, :study_id, :scheduled_at_date, :scheduled_at_time
  belongs_to :study

  attr_accessor :scheduled_at_date, :scheduled_at_time

  after_initialize :get_datetimes # convert db format to accessors
  before_validation :set_datetimes # convert accessors back to db format

  validates :message, presence: true, length: { maximum: 140 }
  validates :study_id, presence:true


##########DateTime Conversion#######

  def get_datetimes
    self.scheduled_at ||= Time.now  # if the scheduled_at time is not set, set it to now

    self.scheduled_at_date ||= self.scheduled_at.to_date.to_s(:db) # extract the date is yyyy-mm-dd format
    self.scheduled_at_time ||= "#{'%02d' % self.scheduled_at.hour}:#{'%02d' % self.scheduled_at.min}" # extract the time
  end

  def set_datetimes
    self.scheduled_at = "#{self.scheduled_at_date} #{self.scheduled_at_time}:00" # convert the two fields back to db
  end  

##########Twilio Stuff############

  def send_sms
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

  def twilio_setup
    @account_sid = 'ACe105d35539084e82b0b6c678c9d31d45'
    @auth_token = '77eee3539875f303400e4ad10f17f26c'
    # set up a client
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
  end

  ######## Rake Task Stuff ############

  def pending_message
    self.sent_at.nil? == true
  end

  def pending_message?
    self.pending_message == true
  end

  def ready_to_send
    self.scheduled_at <= DateTime.now == true
  end

  def ready_to_send?
    self.ready_to_send == true
  end

  def send_message
    if self.ready_to_send? && self.pending_message?
      self.update_attribute(:sent_at, Time.now)
      self.send_sms
      self.destroy
    end
  end




end
