class LocationsController < ApplicationController
  resource_controller
  belongs_to :user
  
  private
    def collection
      @collection ||= current_user.locations.all
    end
end
