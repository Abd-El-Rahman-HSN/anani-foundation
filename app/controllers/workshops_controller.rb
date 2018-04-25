class WorkshopsController < ApplicationController
  load_and_authorize_resource param_method: :workshops_params

  before_action :form_variables, only: [:new, :edit, :create, :update]

  def index
    @workshops = Workshop.accessible_by(current_ability)
    @location = Location.all.map{|u| [u.name]}
  end

  def new
    @workshop= Workshop.new
  end

  def create
    @workshop = Workshop.new(workshops_params)
    @workshop.user_id ||= current_user.id

    if @workshop.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @location_options = Workshop.all.map{ |u| [ u.name, u.id ] }
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update(workshops_params)
      redirect_to workshops_path
    else
      render 'edit'
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    redirect_to workshops_path
  end

  private
    def workshops_params
      params.require(:workshop).permit(:name,:location_id, :user_id)
    end

    def form_variables
      @users = User.where(recorder: true)
      @locations = Location.accessible_by(current_ability)
      
    end
end
