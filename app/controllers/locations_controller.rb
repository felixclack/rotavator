class LocationsController < ApplicationController
  resource_controller
  belongs_to :user
  
  update.wants.html { redirect_to locations_path }
  
  private
    def collection
      if params[:user_id]
        @collection ||= current_user.locations.all
      else
        @collection ||= Location.all
      end
    end
end
