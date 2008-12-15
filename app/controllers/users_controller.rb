class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :get_user, :except => [:index, :new]
  before_filter :set_class
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account created"
      redirect_to users_path
    else
      render :action => :new
    end
  end

  def show
    @user ||= @current_user
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to users_path
    else
      render :action => :edit
    end
  end
  
  protected
    def get_user
      @user ||= User.find(params[:id]) if params[:id]
    end
    
    def set_class
      @page_class = "users"
    end

end
