class RotaFormatsController < ApplicationController
  resource_controller
  
  new_action.wants.js { render :template => "rota_formats/new.html.haml"}
  
  private
    def collection
      @collection ||= RotaFormat.all
    end

end
