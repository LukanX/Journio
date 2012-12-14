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
    if current_study.scheduled_messages.any?
      redirect_to study_scheduled_messages_path(current_study)
    else
    	redirect_to current_study
    end
  end

  def show
  	@study = current_study
  	@scheduled_message = ScheduledMessage.find(params[:id])
  end

  def edit
    @scheduled_message = ScheduledMessage.find(params[:id])
  end

  def update
    @scheduled_message = ScheduledMessage.find(params[:id])
    @study = current_study
    @participant = @study.participants.find_by_phone_number(@scheduled_message.phone_number)
    Time.zone = @participant.time_zone
    if @scheduled_message.update_attributes(params[:scheduled_message])
      flash[:success] = "Message updated"
      redirect_to study_scheduled_messages_path(@study)
    else
      render 'edit'
    end
  end

end
