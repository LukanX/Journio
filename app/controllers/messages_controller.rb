class MessagesController < ApplicationController
	def create
		content = params["Body"]
	    from_number = params["From"]
	    to_number = params["To"]
	    @message = current_study.messages.new(:content = content, :from_number = from_number, :to_number = to_number)
	    @message.save
	end
end
