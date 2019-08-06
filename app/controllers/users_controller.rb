class UsersController < ApplicationController
  include UsersHelper
  before_action :check_if_user_logged_in, only: [:edit, :update]
  before_action :is_this_the_right_user?, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_to companies_url
      flash[:notice] = "Success!"
    elsif user_exists?
      redirect_to login_url
      flash[:danger] = "User exists. Please log in."
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_exists?
      User.exists?(name: @user.name, email: @user.email)
    end

end
