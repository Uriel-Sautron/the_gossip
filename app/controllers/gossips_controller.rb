class GossipsController < ApplicationController
  
  before_action :authenticate_user, only: [:new, :ceate, :show]
  #before_action :permit_user, only: [:destroy, :update, :edit]

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
    session[:gossip_ip] = params[:id]
    @comments = Comment.where(gossip_id: params[:id])
    
  end

  def index
    @gossips = Gossip.all
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content])
    if current_user
      @gossip.user = current_user
    else
      @gossip.user = anonymous
    end

    if @gossip.save
      redirect_to gossips_path
      flash[:success] = "Gossip enregistré"
    else
      flash[:error] = "Error"
      render 'new'
    end
  end
   
  def edit
      @gossip = Gossip.find(params[:id])
  end

  def update
      @gossip = Gossip.find(params[:id])
      gossip_params = params.require(:gossip).permit(:title, :content)
      @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip.id)
  end 

  def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:error] = "Please log in."
      redirect_to new_session_path
    end
  end

  def permit_user
    
    unless current_user == @gossip.user
      flash[:error] = "Seul l' auteur est autorisé"
      redirect_to gossip_path(@gossip.id)
    end
  end

end
