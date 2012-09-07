class ApplicationController < ActionController::Base
  protect_from_forgery

  def new
  end

  def current_study
  	@current_study ||= Study.find_by_id(params[:study_id])
  end

  def current_participant
  	@current_participant ||= participant.find_by_id(params[:participant_id])
  end

  helper_method :current_study
  helper_method :current_participant
  
end
