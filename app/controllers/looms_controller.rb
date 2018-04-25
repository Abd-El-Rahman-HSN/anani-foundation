class LoomsController < ApplicationController
  load_and_authorize_resource param_method: :looms_params
  
  def index
    @looms = Loom.all
    @workshop = Workshop.all.map{|u| [u.name]}
  end

  def new
    @workshop_options = Workshop.all.map{ |u| [ u.name, u.id ] }
    @loom= Loom.new

  end

  def create
    @loom=Loom.new(looms_params)
    if @loom.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @workshop_options = Workshop.all.map{ |u| [ u.name, u.id ] }
    @loom = Loom.find(params[:id])
  end

  def update
    @loom = Loom.find(params[:id])
    if @loom.update(looms_params)
      redirect_to looms_path
    else
      render 'edit'
    end
  end

  def destroy
    @loom = Loom.find(params[:id])
    @loom.destroy
    redirect_to looms_path
  end

  private
    def looms_params
      params.require(:loom).permit(:reference,:workshop_id, :seda_worker, :seda_trainer)
    end
end
