class EntriesController < ApplicationController

  def create
  	 @entry = current_participant.entry.new(params[:entry])
  	 if @entry.save
  	 	redirect_to current_study
  	 else
  	 	render 'new'
  	 end
  end

  def destroy
  end

end