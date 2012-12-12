class ScheduledMessagesController < ApplicationController
  before_filter :admin_user

  def new
  	@scheduled_message = current_study.scheduled_messages.new;
  end
  
  def create
  	@participants = current_study.participants
  	@participants.each do |participant|
  		Time.zone = participant.time_zone
		@scheduled_message = current_study.scheduled_messages.new(params[:scheduled_message])
		@scheduled_message.phone_number = participant.phone_number
		@scheduled_message.save
	end
	if @scheduled_message.save
		flash[:success] = "Messages scheduled"
		redirect_to current_study
	else
		render 'new'
	end
  end

  def index
  	@scheduled_messages = current_study.scheduled_messages.order("scheduled_at ASC")
  	@study = current_study
  	@scheduled_message = ScheduledMessage.find_by_id(params[:id])
  end

  def destroy
  	@scheduled_message = current_study.scheduled_messages.find_by_id(params[:id])
  	@scheduled_message.destroy
  	flash[:success] = "Scheduled message has been canceled"
  	redirect_to current_study
  end

  def show
  	@study = current_study
  	@scheduled_message = ScheduledMessage.find(params[:id])
  end

  def edit
    @scheduled_message = ScheduledMessage.find(params[:id])
  end

end
