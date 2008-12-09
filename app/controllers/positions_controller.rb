class PositionsController < ApplicationController
  resource_controller
  belongs_to :user
  
  private
    def collection
      @collection ||= current_user.positions.all
    end
  
end
