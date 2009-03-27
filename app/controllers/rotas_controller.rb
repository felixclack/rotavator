class RotasController < ApplicationController
  resource_controller
  belongs_to :location, :service, :rota_format
  
  new_action.before do
    @rota_formats = RotaFormat.all
    if @location
      @users ||= @location.users
      @services = @location.services.future.all
    else
      @locations = Location.all
    end
    @rota_format = RotaFormat.find(params[:rota_format_id]) if params[:rota_format_id]
    @service = Service.find(params[:service_id]) if params[:service_id]
    @location ||= @service.location if @service
    @rota ||= Rota.new
    if @rota_format
      @rota_format.positions.each do |position|
        @rota.participations.build(:position => position)
      end
    end
  end
  
  edit.before do
    @rota_formats = RotaFormat.all
    if @location
      @users ||= @location.users
      @services = @location.services.future.all
    else
      @locations = Location.all
    end
    @rota_format = RotaFormat.find(params[:rota_format_id]) if params[:rota_format_id]
    @rota = Rota.find(params[:id])
    @service = @rota.service
  end
  
  create.wants.html do 
    redirect_to location_rotas_path(@location)
  end
  
  def display_format
    @rota_format = RotaFormat.find(params[:format_id])
    respond_to do |wants|
      wants.js
    end
  end
  
  private
    def collection
      if @location
        @collection ||= @location.services.future.all
      else
        @collection ||= Rota.future.all
      end
    end
end
