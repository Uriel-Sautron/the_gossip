class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    puts user_par = params.permit(:email, :password).inspect
     # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    # redirige où tu veux, avec un flash ou pas
      flash[:notice] = "Bonjour #{user.first_name}"
      redirect_to gossips_path
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end

end
