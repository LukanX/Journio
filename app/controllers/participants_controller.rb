class ParticipantsController < ApplicationController

  def create
  	 @participant = current_study.participants.new(params[:participant])
  	 if @participant.save
  	 	flash[:success] = "Participant added!"
  	 	redirect_to current_study
  	 else
  	 	render 'new'
  	 end
  end

  def new
  	@participant = current_study.participants.new
  end

  def destroy
  end

end