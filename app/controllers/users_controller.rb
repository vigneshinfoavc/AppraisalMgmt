class UsersController < ApplicationController
  
  before_action :confirm_login,:manager_list, :except => [:signin, :login, :attempt_login, :logout]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'user created.'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def index
    @user = User.sort
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated.'
      redirect_to(:action => 'index')
    else
      redirect_to(:action => 'edit')
    end
  end
  
  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'index')
  end
  
  def signin
  
  end
  
  def login
    begin
    if params[:username].present? && params[:password].present?
      user = User.where(:username => params[:username]).first
      if user
        authorized_user = user.authenticate(params[:password])
      end
    end
    if user.role == params[:role]
      check = true
    elsif user.role == "Manager" && params[:role] != "Select"
      check = params[:role] != "Admin" ? true : false
    else
      check = false
    end
    if authorized_user && check
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:role] = params[:role]
      flash[:notice] = "You are now Signed In."
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid username/password Credentials."
      redirect_to(:action => 'signin')
    end
  rescue
      flash[:notice] = "Invalid username/password Credentials."
      redirect_to(:action => 'signin')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "signin")
  end
  
  def home
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name,:email, :username, :password,:role,:manager_id, :password_confirmation)
  end
  
  def manager_list
    @managers = User.manager_list
  end
end
