class StudiesController < ApplicationController
  
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
end
