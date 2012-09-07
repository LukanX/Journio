class MessagesController < ApplicationController
	def create
		content = params["Body"]
	    from_number = params["From"]
	    to_number = params["To"]
	    @message = current_study.messages.new(params[:message])
	    @message.save
	end
end
