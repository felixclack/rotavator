class ServicesController < ApplicationController
  resource_controller
  belongs_to :location
  
  index.before do
    if params[:location_id]
      @location ||= Location.find(params[:location_id])
    else
      @locations ||= Location.all
    end
  end
  
  create.wants.html { redirect_to location_services_path(@location) }
  
  private
    def collection
      if params[:location_id]
        @location ||= Location.find(params[:location_id])
        @collection ||= @location.services.future.all
      else
        @collection ||= Service.future.all
      end
    end
  
end
