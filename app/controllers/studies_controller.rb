class StudiesController < ApplicationController
  before_filter :signed_in_user, only: :show
  before_filter :admin_user,     only: [:destroy, :edit, :update, :new, :create]
  
  def show
  	@study = Study.find(params[:id])
  	@participants = @study.participants.paginate(page: params[:page])
  end

  def new
  	@study = Study.new
  end

  def index
  	@studies = Study.all
  end

  def create
  	@study = Study.new(params[:study])
  	if @study.save
  		flash[:success] = "You've created a new study! Now add particiapnts."
  		redirect_to @study
  	else
  		render 'new'
  	end
  end

  def edit
  	@study = Study.find(params[:id])
  end

  def update
  	@study = Study.find(params[:id])
    if @study.update_attributes(params[:study])
      flash[:success] = "Study updated"
      redirect_to @study
    else
      render 'edit'
    end
  end

  def destroy
    Study.find(params[:id]).destroy
    flash[:success] = "Study deleted"
    redirect_to root_path
  end
end
