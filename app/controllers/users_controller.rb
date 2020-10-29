class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.city_id = 11
    if @user.save
      log_in(@user)
      redirect_to gossips_path

    else
      render 'new'
    end
  end




  private
  def user_params
    params.permit(:first_name, :last_name, :age, :descrition, :email, :password, :city)
  end
end
