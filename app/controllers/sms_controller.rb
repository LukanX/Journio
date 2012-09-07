class SmsController < ApplicationController
  

  def create
    message = params[:message]
    if message.present?
      current_study.participants.each do |participant|
        participant.send_sms(message)
      end
      flash[:success] = "You've send a text!"
    else
      flash[:error] = "Enter a message."
    end
    redirect_to study_path(current_study)
  end
end