class AppraiseeController < ApplicationController
  layout 'admin'
  before_action :confirm_login
  def index
    @appraisees = Appraisee.by_employee(session[:user_id],session[:role]).sort
  end
  
  def new
    @appraisee = Appraisee.new
  end
  
  def create
    params[:appraisee][:user_id] = session[:user_id]
    @appraisee = Appraisee.new(appraisee_params)
    if @appraisee.save
      flash[:notice] = "Appraisse created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def edit
    @appraisee = Appraisee.find params[:id]
  end
  
  def update
    @appraisee = Appraisee.find params[:id]
    if @appraisee.update_attributes(appraisee_params)
      flash[:notice] = 'Appraisse updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end
  
  def delete
    @appraisee = Appraisee.find params[:id]
    @appraisee.destroy
    flash[:notice] = "Appraisee Item destroyed."
    redirect_to(:action => 'index')
  end
  
  private
  
  def appraisee_params
      params.require(:appraisee).permit(:trainings, :projects, :appreciations, :remarks, :feedback, :user_id, :month,:year,:is_complete)
  end
  
end
