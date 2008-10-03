class ServicesController < ApplicationController
  before_filter :get_location
  before_filter :get_service, :only => [:show, :edit, :update, :destroy]
  def index
    @services = @location.services.future.all
  end
  
  def show
  end
  
  def new
    @service = @location.services.build
  end
  
  def create
    @service = @location.services.build(params[:service])
    if @service.save
      flash[:notice] = "Created a new service"
      redirect_to location_service_path(@location, @service)
    else
      flash[:error] = "There was an error."
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @service.update_attributes(params[:service])
      flash[:notice] = "Updated the service."
      redirect_to location_service_path(@location, @service)
    else
      flash[:error] = "Failed to update the service."
      render :action => "edit"
    end
  end
  
  def destroy
    if @service.destroy
      flash[:notice] = "Service deleted."
      redirect_to location_services_path(@location)
    else
      flash[:error] = "Failed to delete service."
      redirect_to location_service_path(@location, @service)
    end
  end
  
  protected
    def get_location
      @location = Location.find(params[:location_id])
    end
    
    def get_service
      @service = @location.services.find(params[:id])
    end
  
end
