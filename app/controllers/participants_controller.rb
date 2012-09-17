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

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @study = current_study
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(params[:participant])
      flash[:success] = "Participant updated"
      redirect_to study_participant_path(@study, @participant.id)
    else
      render 'edit'
    end
  end

  def show
    @account_sid = 'ACe105d35539084e82b0b6c678c9d31d45'
    @auth_token = '77eee3539875f303400e4ad10f17f26c'
    # set up a client
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
    @study = current_study
    @participant = Participant.find(params[:id])
  end

  def destroy
    Participant.find(params[:id]).destroy
    flash[:success] = "Participant deleted from study"
    redirect_to current_study
  end

end