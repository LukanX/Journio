class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user, only: [:edit, :update ]
  before_filter :admin_user,     only: [:destroy, :index]
  def new
  	@user = User.new
  end

  def create
	 @user = User.new(params[:user])
	 if @user.save
    sign_in @user
	 	flash[:success] = "Welcome to Journio!"
	 	redirect_to @user
	 else
	 	render 'new'
	 end
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Account updated"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
end
