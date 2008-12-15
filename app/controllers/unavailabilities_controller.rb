class UnavailabilitiesController < ApplicationController
  resource_controller
  belongs_to :user
  
  new_action.wants.js
  update.wants.html { redirect_to @user }
  
  private
    def collection
      @collection ||= @user.unavailabilities.future.all
    end
end
