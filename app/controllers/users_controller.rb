class UsersController < ApplicationController
  before_filter :get_user, :only => [:show, :edit, :update]
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.register! if @user && @user.valid?
    success = @user && @user.valid?
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    unless params[:locations].nil?
      params[:locations][:location_ids].each do |location_id|
        @user.locations << Location.find(location_id)
      end
    end
    unless params[:positions].nil?
      params[:positions][:position_ids].each do |position_id|
        @user.positions << Position.find(position_id)
      end
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Updated"
      redirect_to user_path
    else
      flash[:error] = "Error"
      render :action => "edit"
    end
  end
  
  protected
    def get_user
      @user = User.find(params[:id])
    end
end
