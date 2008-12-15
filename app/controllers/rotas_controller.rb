class RotasController < ApplicationController
  before_filter :get_location
  before_filter :get_rota, :only => [:show, :edit, :update, :destroy]
  def index
    if params[:location_id]
      @rotas = Rota.find(:all, :include => [:service => :location], :conditions => ["locations.id = ? AND rotas.id = ?", params[:location_id], params[:id]])
    elsif params[:user_id]
      @rotas = current_user.rotas
    else
      @rotas = Rota.all
    end
  end
  
  def show
  end
  
  def new
    if params[:location_id]
      get_location
      @rota = Rota.new
      @users = @location.users
      @formats = Format.all
    else
      @locations = Location.all
    end
  end
  
  def create
    @rota = Rota.new(params[:rota])
    @rota.team = Team.first
    if @rota.save
      flash[:notice] = "Created a new rota"
      redirect_to location_rota_path(@location, @rota)
    else
      flash[:error] = "There was an error."
      render :action => "new"
    end
  end
  
  def edit
    @users = @location.users
  end
  
  def update
    if @rota.update_attributes(params[:rota])
      flash[:notice] = "Updated the rota."
      redirect_to location_rota_path(@location, @rota)
    else
      flash[:error] = "Failed to update the rota."
      render :action => "edit"
    end
  end
  
  def destroy
    if @rota.destroy
      flash[:notice] = "Rota deleted."
      redirect_to location_rotas_path(@location)
    else
      flash[:error] = "Failed to delete service."
      redirect_to location_rota_path(@location, @rota)
    end
  end
  
  protected
    def get_location
      @location = Location.find(params[:location_id]) if params[:location_id]
    end
    
    def get_rota
      @rota = Rota.find(:first, :include => [:service => :location], :conditions => ["locations.id = ? AND rotas.id = ?", params[:location_id], params[:id]])
    end
end
