class ServicesController < ApplicationController
  resource_controller
  belongs_to :location
  
  index.before do
    @locations ||= Location.all unless params[:location_id]
    @rota ||= Rota.new
  end
  
  index.wants.js
  new_action.wants.js
  
  create do
    wants.html { redirect_to location_services_path(@location) }
    wants.js
    
    failure do
      flash "There was an error creating that service"
      wants.js { render :template => "services/failure.js.erb" }
    end
  end

  
  private
    def collection
      if params[:location_id]
        @location ||= Location.find(params[:location_id])
        @collection = @location.services.future.all
      else
        @collection ||= Service.future.all
      end
    end
  
end
