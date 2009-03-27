class LocationsController < ApplicationController
  resource_controller
  belongs_to :user
  
  update.wants.html { redirect_to locations_path }
  
  show.wants.js { render :template => "/locations/show.html.haml" }
  
  index.before do
    #@page_class = "dashboard" if params[:user_id]
    @services = Service.future.all
  end
  
  private
    def collection
      if params[:user_id]
        @collection ||= current_user.locations.all
      else
        @collection ||= Location.all
      end
    end
end
