class PagesController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def dashboard
    @page_class = "dashboard"
    @user ||= current_user
  end
  
  
  
end
