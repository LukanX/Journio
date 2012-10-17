class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

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

  private
    private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
