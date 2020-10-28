class WelcomeController < ApplicationController
  
  def show
    @first_name = params[:first_name]
  end
  

  def user
    @user = User.find_by(id: params[:user_id])
  end
end
  
