class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def index
  end

  def create
   
    @gossip = Gossip.create(title: params[:title], content: params[:content], user: User.first)
    if @gossip.save
      redirect_to gossips_path
      flash[:success] = "Gossip enregister"
    else
      render 'new'
      flash[:error] = "Error"
    end
  end


end
