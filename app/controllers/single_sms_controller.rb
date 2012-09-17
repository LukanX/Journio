class SingleSmsController < ApplicationController
	
	def create
		@participant = Participant.find(params[:participant_id])
	    message = params[:message]
	    if message.present?
	      @participant.send_sms(message)
	      flash[:success] = "You've sent a text!"
	    else
	      flash[:error] = "Enter a message."
	    end
	    redirect_to study_participant_path(current_study, @participant)
	end
end
