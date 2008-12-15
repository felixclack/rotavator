class ParticipationsController < ApplicationController
  before_filter :get_user, :except => [:confirm, :decline]
  before_filter :get_participation, :only => [:show, :edit, :update, :destroy, :confirm, :decline]
  def index
    @participations = @user.participations.future.all
  end
  
  def show
  end
  
  def new
    @participation = Participation.new
    @rotas = @user.rotas_available_for
  end
  
  def create
    @participation = @user.participations.build(params[:participation])
    if @participation.save
      flash[:notice] = "Created a new participation"
      redirect_to user_participation_path(@user, @participation)
    else
      flash[:error] = "There was an error."
      render :action => "new"
    end
  end
  
  def edit
    @rotas = @user.rotas_available_for
  end
  
  def update
    if @participation.update_attributes(params[:participation])
      flash[:notice] = "Updated particpation."
      redirect_to user_participation_path(@user, @participation)
    else
      flash[:error] = "Failed to update participation."
      render :action => "edit"
    end
  end
  
  def destroy
    if @participation.destroy
      flash[:notice] = "Participation deleted."
      redirect_to user_participations_path(@user)
    else
      flash[:error] = "Failed to delete service."
      redirect_to user_participation_path(@user, @participation)
    end
  end
  
  def confirm
    @participation.confirm!
    flash[:notice] = "Position confirmed"
    respond_to do |wants|
      wants.html { redirect_to dashboard_path }
    end
  end
  
  def decline
    @participation.decline!
    flash[:notice] = "Position declined"
    respond_to do |wants|
      wants.html { redirect_to dashboard_path }
    end
  end
  
  protected
    def get_user
      @user = User.find(params[:user_id])
    end
    
    def get_participation
      if @user
        @participation ||= @user.participations.find(params[:id])
      else
        @participation ||= Participation.find(params[:id])
      end
      
    end
  
end
