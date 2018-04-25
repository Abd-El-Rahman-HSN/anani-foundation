class LocationsController < ApplicationController
  load_and_authorize_resource param_method: :locations_params

  def index
    @locations= Location.all
  end

  def new
    @location= Location.new

  end

  def create
    @location=Location.new(locations_params)
    if @location.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(locations_params)
      redirect_to locations_path
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
    def locations_params
      params.require(:location).permit(:id,:name)
    end
end
