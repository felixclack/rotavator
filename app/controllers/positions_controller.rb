class PositionsController < ApplicationController
  resource_controller
  belongs_to :user, :format
  
  show.wants.js { render :template => "/positions/show.html.haml" }
  new_action.wants.js { render :template => "/positions/new.html.haml" }
  
  private
    def collection
      @collection ||= current_user.positions.all
    end
  
end
