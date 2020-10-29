class GossipsController < ApplicationController
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
    @gossip = Gossip.create(title: params[:title], content: params[:content], user: User.first)
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


end
